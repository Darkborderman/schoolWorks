#define lepin1 17
#define lepin2 16
#define repin1 15
#define repin2 14
#define luspinE 11
#define luspinT 10
#define ruspinE 8
#define ruspinT 9
#define muspinE 12
#define muspinT 13
#define buttom 6
void setup()
{
 Serial.begin(9600);
 pinMode(lepin1,OUTPUT);
 pinMode(lepin2,OUTPUT);
 pinMode(repin1,OUTPUT);
 pinMode(repin2,OUTPUT);
 pinMode(buttom,OUTPUT);
 digitalWrite(6,LOW);
 pinMode(6,INPUT);
 pause(2000);
   forward(600);
}

void loop()
{
  int frequency=0;
  float result[3];
  result[0]=get_distance(luspinE,luspinT);
  result[1]=get_distance(ruspinE,ruspinT);
  result[2]=get_distance(muspinE,muspinT);
  Serial.print(result[0]);
  Serial.println("cm Left\n");
  Serial.print(result[1]);
  Serial.println("cm Right\n");
  Serial.print(result[2]);
  Serial.println("cm Mid\n");
  /*Nonstop VERSION*/

  if(result[1]<=9&&result[0]>=10&&result[0]<13)
  {
    Serial.println("left adjust");
    left(40);
  }
  else if(result[0]<=9&&result[1]>=10&&result[1]<13)
  {
    Serial.println("right adjust");
    right(40);
  }
  
  if(digitalRead(6)==HIGH)
  {        
    pinMode(6,OUTPUT);
    digitalWrite(6,LOW);
    pinMode(6,INPUT);
    Serial.println("backward");
    backward(490);
    pause(20);
  }
  if(result[1]>=20)
  {
    Serial.println("right");
    right(620);
  }
  else
  {
    Serial.println("forward");
    forward(1);
  }
}

float get_distance(int echo, int trig)
{
    float duration;
    pinMode(trig,OUTPUT);
    pinMode(echo,INPUT);
    digitalWrite(trig,HIGH);
    delayMicroseconds(20);//send ultrasound per 10us
    digitalWrite(trig,LOW);
    duration=pulseIn(echo,HIGH,5000000);//time of ultrasound came from and back
    duration=duration/2; //one-way
    return duration/29; //return cm

}
void forward(int t)
{
  analogWrite(lepin1,240);
  analogWrite(lepin2,0);
  analogWrite(repin1,240);
  analogWrite(repin2,0);
  delay(t);
}
void backward(int t)
{
  analogWrite(lepin1,0);
  analogWrite(lepin2,40);
  analogWrite(repin1,0);
  analogWrite(repin2,240);
  delay(t);
}
void right(int t)
{
  analogWrite(lepin1,80);
  analogWrite(lepin2,0);
  analogWrite(repin1,240);
  analogWrite(repin2,0);
  delay(t);
}
void left(int t)
{
  analogWrite(lepin1,240);
  analogWrite(lepin2,0);
  analogWrite(repin1,80);
  analogWrite(repin2,0);
  delay(t);
}

void pause(int t)
{
  analogWrite(lepin1,0);
  analogWrite(lepin2,0);
  analogWrite(repin1,0);
  analogWrite(repin2,0);
  delay(t);
}

