#include <WiFiClient.h>
#include <LWiFi.h>
#include <task.h>
#include <math.h>
#include <FreeRTOS.h>


#define SSID "1scream2.4G"
#define PASSWD "2017scream"
#define TCP_IP "192.168.0.50"
//#define TCP_IP_PHONE "192.168.0.31"
#define TCP_PORT 5000   

//false for waiting for start, true for game finished
static bool timetogo = false; 

//wificlient connect between car and wifiserver
WiFiClient wifiClient;
static char buf[64],buf_send[64];

//wificlient connect between car and phone
/*
WiFiClient wifiClientPh;
static char bufPh[64],buf_phsend[64];
*/

static char client_ID[] = "NightKirie";
static int treasure[4][2] = {0};
static int index,step=0,check=0;
bool falsetrue = false;

//step for Dst1 to Dst2, check for things in step
static char *recv_ID, *recv_buf, *recv_mod, name[32];

enum MotorPinID
{
    L_F = 0,
    L_B,
    R_F,
    R_B,
    NUM_OF_MOTOR_PIN
};
class point
{
    public:
    point(int x=-1,int y=-1);
    int x,y;
};
point::point(int x,int y)
{
    this->x=x;
    this->y=y;
}
//Dst1 for first destination(may not be my treasure)
point Dst1Pos,MyPos,Dst2Pos;

//xTaskHandle xaskPos;

/*enum UltrasonicPinID {
    U_F = 0,
    U_L,
    U_R,
    NUM_OF_ULTRASONIC_PIN
};*/

// Pin assignment
//static const uint8_t usTrigPins[NUM_OF_ULTRASONIC_PIN] = {2, 4, 6};  // F, L, R
//static const uint8_t usEchoPins[NUM_OF_ULTRASONIC_PIN] = {3, 5, 7};  // F, L, R
static const uint8_t motorPins[NUM_OF_MOTOR_PIN] = {14, 15, 16, 17};  //  L_F, L_B, R_F, R_B
static const uint8_t buttonPins = 2;

void setup(){
    int motorpins = 0;
    int status = WL_IDLE_STATUS;
    while(motorpins < NUM_OF_MOTOR_PIN){
        pinMode(motorPins[motorpins],OUTPUT);
        motorpins++;
    }
	pinMode(buttonPins, INPUT);
    Serial.begin(115200);
    while (!Serial)
        ;       
    // set WiFi
    WiFi.begin(SSID, PASSWD);
    while (status != WL_CONNECTED) {
    // Connect failed, blink 0.5 second to indicate
    // the board is retrying.
        delay(500);
        WiFi.begin(SSID, PASSWD);
        status = WiFi.begin(SSID, PASSWD);
        status =  WiFi.begin(SSID, PASSWD);
        Serial.print("Attempting to connect to SSID: ");
        Serial.println(SSID);
    }
    
    // Conenct to AP successfully
    while (!wifiClient.connect(TCP_IP, TCP_PORT)){
        Serial.print("Attempting to connect to SERVER: ");
        Serial.println(TCP_IP);
    }
    /*while (!wifiClientPh.connect(TCP_IP_PHONE, TCP_PORT)){
        delay(300);
        Serial.print("Attempting to connect to PHONE SERVER: ");
        Serial.println(TCP_IP_PHONE);
    }*/
    reg_ID();
    xTaskCreate(
        askPos,          /* Task function. */
        "askPos",        /* String with name of task. */
        10000,           /* Stack size in words. */
        NULL,            /* Parameter passed as input of the task */
        1,               /* Priority of the task. */
        NULL);           /* Task handle. */
}

/*double ultrasonicGetDistance(uint8_t trig, uint8_t echo){
    double duration;
    vTaskSuspend(xaskPos);
    pinMode(trig, OUTPUT);
    pinMode(echo, INPUT);
    digitalWrite(trig, HIGH);
    delayMicroseconds(10);
    digitalWrite(trig, LOW);
    duration = pulseIn(echo, HIGH, 2000L);
    vTaskResume(xaskPos);
    return duration / 29 / 2;
}*/

/*void send_phone(int x,int y){
    sprintf(buf_phsend,"(%d,%d)",x,y);
    wifiClientPh.write(buf_phsend, strlen(buf_phsend));
    wifiClientPh.flush();
}*/

void askPos( void * parameter ){
    //get message from server
    //format: Master|Words
    //or like: Master|(1,2)(3,4)
    //so we need to escape | and some characters
    while(1){
        //read message from server
        if (wifiClient.available())
        {
            for(int i=0;i<64&&buf[i]!='\r';i++)
            {
                buf[i]=wifiClient.read();
            }
            recv_ID = strtok(buf,"|");
            recv_buf = strtok(NULL,"|");
            if(!strcmp(recv_ID, "Master")){     //From Master
                if(!strcmp(recv_buf, "Start"))
                {     //Start
                    timetogo = true;
                    step = 0;
                    index=setIndex(MyPos.x,MyPos.y);
                    delay((index+1)*50);
                    send_mes("Treasure","");
                }
                else if(!strcmp(recv_buf, "Done"))  //game End
                {
                    timetogo = false;
                }
                else{ //Something else
                    recv_mod = strtok(recv_buf,":");
                    if(!strcmp(recv_mod, "Treasure")){  //get treasure position
                        recv_mod = strtok(NULL, ":");
                        sscanf(recv_mod, "(%d, %d)(%d, %d)(%d, %d)(%d, %d)", &treasure[0][0], &treasure[0][1], &treasure[1][0], &treasure[1][1], &treasure[2][0], &treasure[2][1], &treasure[3][0], &treasure[3][1]);
                        Dst1Pos=point(treasure[index][0],treasure[index][1]);
                    }
                    else if(!strcmp(recv_mod, "False")){    //get false
                        recv_mod = strtok(NULL, ":");
                        sprintf(name, "(%d, %d)",treasure[index][0],treasure[index][1]);
                        send_mes(recv_mod, name);
                        falsetrue = true;
                    }
                    else if(!strcmp(recv_mod, "POS")){
                        recv_mod = strtok(NULL, ":");
                        sscanf(recv_mod, "(%d,%d)", &MyPos.x, &MyPos.y);
                    }
                }
            }
            else
            {   //get my treasure position
                sscanf(recv_buf, "(%d, %d)", &Dst2Pos.x, &Dst2Pos.y); 
            }
            send_mes("Position","");
        }
    }
    vTaskDelete(NULL);
}

void freeze(int t){
    analogWrite(motorPins[L_F], 0);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 0);
    analogWrite(motorPins[R_B], 0);
    delay(t);
}
void forward(int t){
    analogWrite(motorPins[L_F], 150);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 150);
    analogWrite(motorPins[R_B], 0);
    delay(t);
}
void backward(int t){
    analogWrite(motorPins[L_F], 0);
    analogWrite(motorPins[L_B], 150);
    analogWrite(motorPins[R_F], 0);
    analogWrite(motorPins[R_B], 150);
    delay(t);
}
void left(int t){
    analogWrite(motorPins[L_F], 0);
    analogWrite(motorPins[L_B], 150);
    analogWrite(motorPins[R_F], 150);
    analogWrite(motorPins[R_B], 0);
    delay(t);
}
void right(int t){
    analogWrite(motorPins[L_F], 150);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 0);
    analogWrite(motorPins[R_B], 150);
    delay(t);
}
void slightly_left(int t){
    analogWrite(motorPins[L_F], 0);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 150);
    analogWrite(motorPins[R_B], 0);
    delay(t);
}
void slightly_right(int t){
    analogWrite(motorPins[L_F], 150);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 0);
    analogWrite(motorPins[R_B], 0);
    delay(t);
} 


//for remote
/*
void remoteCommand()
{
    if(timetogo == true)
    {
        // Stop moving
        if (bufPh[1] == 'E')
        {
            freeze(0);
        }
        else
        {
            switch (bufPh[0])
            {
                case 'F':   // Forward
                    forward(0);
                    break;
                case 'B':   // Backward
                    backward(0);
                    break;
                case 'L':   // Turn left
                    left(0);
                    break;
                case 'R':   // Turn right
                    right(0);
                    break;
                case 'Z':   // Special stuff
                    break;
            }
        }
    }
    else if(timetogo == false)
    {
        freeze(0);
    }
}
*/

void loop()
{   
    //for remote
    /*
    if (wifiClientPh.available())
    {
        bufPh[0] = wifiClientPh.read();
        bufPh[1] = wifiClientPh.read();
        remoteCommand();
    }
    */

    //for self-moving
    if(step != 2){   //for game start
        pushButton();
        if(step == 0 && Dst1Pos.x != -1){	//for go to first point(may not be the treasure)
            if(check == 0){
                double degree;
                point NewPos;
                switch(index){
                    case 0:
                        NewPos=point(-(Dst1Pos.y - MyPos.y),Dst1Pos.x - MyPos.x);
                        break;
                    case 1:
                        NewPos=point(Dst1Pos.x - MyPos.x,Dst1Pos.y - MyPos.y);
                        break;
                    case 2:
                        NewPos=point(Dst1Pos.y - MyPos.y,-(Dst1Pos.x - MyPos.x));
                        break;
                    case 3:
                        NewPos=point(-(Dst1Pos.x - MyPos.x),-(Dst1Pos.y - MyPos.y));
                        break;
                }
                degree = atan2(NewPos.y, NewPos.x);
                if(degree >= 0) //turn 90 degree
                    right(300);
                else
                    left(300);
                check = 1;
            }
            else if(check == 1){
                if(abs(MyPos.x - Dst1Pos.x) <= 50 && abs(MyPos.y - Dst1Pos.y) <= 50 && (falsetrue || timetogo == false)){	//if get to the Dst1
                    step = 1;
                    check = 0;
                    Dst1Pos=point(-1,-1);
                    freeze(0);
                }
                point PrevPos=point(MyPos.x,MyPos.y);
                forward(50);
                double Dst1Dir = atan2(Dst1Pos.y - PrevPos.y, Dst1Pos.x - PrevPos.x);
                double MyDir = atan2(MyPos.y - PrevPos.y, MyPos.x - PrevPos.x);
                if(MyDir - Dst1Dir < 0 || MyDir - Dst1Dir > PI)
                    slightly_right(75);
                else if(MyDir - Dst1Dir > 0)
                    slightly_left(75);
            }
        }
        else if(step == 1 && Dst2Pos.x != -1){	//for go to the real treasure
            point PrevPos=point(MyPos.x,MyPos.y);
            forward(50);
            freeze(0);
            double Dst2Dir = atan2(Dst2Pos.y - PrevPos.y, Dst2Pos.x - PrevPos.x);
            double MyDir = atan2(MyPos.y - PrevPos.y, MyPos.x - PrevPos.x);
            if(check == 0)
            {
                if(MyDir - Dst2Dir < 0 || MyDir - Dst2Dir > PI)
                    right(300);
                else if(MyDir - Dst2Dir > 0)
                    left(300);
                check = 1;
            }
            else if(check == 1)
            {
                if(MyDir - Dst2Dir < 0 || MyDir - Dst2Dir > PI)
                    slightly_right(75);
                else if(MyDir - Dst2Dir > 0)
                    slightly_left(75);
            }
        }
        else{	//all other condition
            freeze(0);
        }
    }
    //for game end
    if(timetogo == false && step != 0)
    {     
        step = 2;
        check = 0;
        Dst2Pos=point(-1,-1);
        freeze(0);
        falsetrue = false;
    }
}

//detect button is triggered or not
void pushButton()
{
    if(digitalRead(buttonPins) == HIGH)
    {
        backward(100);
        left(250);
        forward(100);
    }
}
//setup treasure index
int setIndex(int x,int y)
{
    //position is at up or down
    if(x>=192&&x<=256)
    {
        //position at up
        if(y<=192) index=0;
        //position at down
        else if(y>=256) index=2;
    }
    //position is at left or right
    else if(y>=192&&y<=256)
    {
        //position at left
        if(x<=192) index=3;
        //position at right
        else if(x>=256) index=1;
    }
}

void reg_ID(){
    strcpy(buf,"Register|");
    strcat(buf,client_ID);
    wifiClient.write(buf,strlen(buf));
    wifiClient.flush();
}

void send_mes(char ID[],char mes[]){
    sprintf(buf,"%s|%s",ID,mes);
    wifiClient.write(buf, strlen(buf));
    wifiClient.flush();
}