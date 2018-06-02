#include <WiFiClient.h>
#include <LWiFi.h>
#include <task.h>
#include <math.h>

#define SSID "1scream2.4G"
#define PASSWD "2017scream"
#define TCP_IP "192.168.0.38"
#define TCP_PORT 5000


#define motorPinAmount 4

static bool timetogo = false; //false for waiting for start, true for can remote
WiFiClient wifiClient;
WiFiClient wifiClientPh;
static char buf[48],bufPh[48],buf_send[32],buf_phsend[32];
static char client_ID[] = " Divik",Team[] = "DWLT";
static int messageLen,phmessageLen;
static int MyPosX, MyPosY, DstPosX, DstPosY, detection = 0;
static char *recv_ID,*recv_buf;

enum MotorPinID {
    L_F = 0,
    L_B,
    R_F,
    R_B,
    NUM_OF_MOTOR_PIN
};
enum UltrasonicPinID {
    U_F = 0,
    U_L,
    U_R,
    NUM_OF_ULTRASONIC_PIN
};
/* Pin assignment */
static const uint8_t usTrigPins[NUM_OF_ULTRASONIC_PIN] = {2, 4, 6};  // F, L, R
static const uint8_t usEchoPins[NUM_OF_ULTRASONIC_PIN] = {3, 5, 7};  // F, L, R
static const uint8_t motorPins[NUM_OF_MOTOR_PIN] = {15, 14, 17, 16};  //  L_F, L_B, R_F, R_B

void setup(){
    //
    for(int i=0;i<motorPinAmount;i++) pinMode(motorPins[i],OUTPUT);

    int status = WL_IDLE_STATUS;
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
        status =  WiFi.begin(SSID, PASSWD);
        Serial.print("Attempting to connect to SSID: ");
        Serial.println(SSID);
        Serial.println(status);
    }
    
    // Conenct to AP successfully
    while (!wifiClient.connect(TCP_IP, TCP_PORT)){
    //delay(300);
        Serial.print("Attempting to connect to SERVER: ");
        Serial.println(TCP_IP);
    }
    reg_ID();
    //delay(1000);
    xTaskCreate(
                    askPos,          /* Task function. */
                    "askPos",        /* String with name of task. */
                    10000,            /* Stack size in words. */
                    NULL,             /* Parameter passed as input of the task */
                    1,                /* Priority of the task. */
                    NULL);            /* Task handle. */
}  
double ultrasonicGetDistance(uint8_t trig, uint8_t echo){
    double duration;
    pinMode(trig, OUTPUT);
    pinMode(echo, INPUT);
    digitalWrite(trig, HIGH);
    delayMicroseconds(5);
    digitalWrite(trig, LOW);
    duration = pulseIn(echo, HIGH, 20000L);
    return duration / 29 / 2;
}
void reg_ID()
{
    strcpy(buf,"Register|");
    strcat(buf,client_ID);
    wifiClient.write(buf, strlen(buf));
    wifiClient.flush();
}

void send_mes(char ID[],char mes[])
{
    sprintf(buf,"%s|%s",ID,mes);
    wifiClient.write(buf, strlen(buf));
    wifiClient.flush();
}

void askPos( void * parameter )
{
    while(1){
        if ((messageLen = wifiClient.available()) > 0) {
            int i = 0;
            do{
                buf[i++] = wifiClient.read();
            }while(i<32 && buf[i-1]!='\r'); 
            buf[i-1] = '\0';
            recv_ID = strtok(buf,"|\0");
            //Serial.print(recv_ID);
            //Serial.print(":");
            recv_buf = strtok(NULL,"|\0");
            //Serial.println(recv_buf);
            if(strcmp(recv_buf, "Start") == 0){
                timetogo = true;
                detection = 0;
            }
            else if(strcmp(recv_buf, "Done") == 0){
                timetogo = false;
                detection = 0;
            }
            else
                sscanf(recv_buf,"POS:(%d,%d)(%d,%d)",&MyPosX,&MyPosY,&DstPosX,&DstPosY);
            Serial.println(MyPosX);
            Serial.println(MyPosY);
            //send_phone(MyPosX,MyPosY); 
            send_mes("Position","");
        }
    }
    vTaskDelete( NULL );
 
}
void freeze(int t){
    analogWrite(motorPins[L_F], 0);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 0);
    analogWrite(motorPins[R_B], 0);
    delay(t);
}
void forward(int t){
    analogWrite(motorPins[L_F], 245);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 255);
    analogWrite(motorPins[R_B], 0);
    delay(t);
}
void backward(int t){
    analogWrite(motorPins[L_F], 0);
    analogWrite(motorPins[L_B], 255);
    analogWrite(motorPins[R_F], 0);
    analogWrite(motorPins[R_B], 255);
    delay(t);
}
void left(int t){
    analogWrite(motorPins[L_F], 0);
    analogWrite(motorPins[L_B], 255);
    analogWrite(motorPins[R_F], 255);
    analogWrite(motorPins[R_B], 0);
    delay(t);
}
void right(int t){
    analogWrite(motorPins[L_F], 245);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 0);
    analogWrite(motorPins[R_B], 255);
    delay(t);
}
void slightly_left(int t){
    analogWrite(motorPins[L_F], 0);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 255);
    analogWrite(motorPins[R_B], 0);
    delay(t);
}
void slightly_right(int t){
    analogWrite(motorPins[L_F], 245);
    analogWrite(motorPins[L_B], 0);
    analogWrite(motorPins[R_F], 0);
    analogWrite(motorPins[R_B], 0);
    delay(t);
} 
void ultrasonictest(int t, float df, float dl, float dr){
    Serial.println(df);
    Serial.println(dl);
    Serial.println(dr);
    delay(t);
}

void loop()
{   
    double df, dl, dr;
    df = ultrasonicGetDistance(usTrigPins[U_F], usEchoPins[U_F]);
    dl = ultrasonicGetDistance(usTrigPins[U_L], usEchoPins[U_L]);
    dr = ultrasonicGetDistance(usTrigPins[U_R], usEchoPins[U_R]);
    //for self-moving
    if(timetogo == true){   //for game start
        static const int InitPosX = MyPosX;
        static const int InitPosY = MyPosY;
        if(detection == 0){
            forward(0);
            if(abs(InitPosX - MyPosX) > 240 || abs(InitPosY - MyPosY) > 200){
                freeze(100);
                static const int MidDirX = MyPosX - InitPosX;
                static const int MidDirY = MyPosY - InitPosY;
                static const double MidDir = atan2(MidDirY, MidDirX);
                static const int InitDirX = DstPosX - InitPosX;
                static const int InitDirY = DstPosY - InitPosY;
                static const double InitDir = atan2(InitDirY, InitDirX);
                if(MidDir - InitDir < 0 || MidDir - InitDir > PI)
                    right(250);
                else if(MidDir - InitDir > 0)
                    left(250);    
                detection = 1;
            }
        }
        if(detection == 1){
            static int MidPosX = MyPosX;
            static int MidPosY = MyPosY; 
            static const int EndDirX = DstPosX - MidPosX;
            static const int EndDirY = DstPosY - MidPosY;
            static const double EndDir = atan2(EndDirY, EndDirX);
            forward(0);
            delay(50);
            double MyDir = atan2(MyPosY - MidPosY, MyPosX - MidPosX);
            if(MyDir - EndDir < 0 || MyDir - EndDir > PI){
                slightly_right(75);
                forward(50);
            }
            else if(MyDir - EndDir > 0){
                slightly_left(75);
                forward(50);
            }
            else{
                forward(0);    
            }
        }
    }
    else if(timetogo == false){     //for game end
        freeze(0);
    }
} 
