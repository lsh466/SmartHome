#include <IRremote.h>
#include <SoftwareSerial.h>
#include <string.h>


int push = 0;
int fire_push = 0;
//wifi

SoftwareSerial esp_wifi(2, 3); //(tx, rx)
String Address = "snivy92.cafe24.com";

//모터
int in1=7; 
int in2=6;
char a;
int speed_pin = 5;
int speed_n = 75;
int close_state=1;
int del = 100;
//적외선
int RECV_PIN = 8;

IRrecv irrecv(RECV_PIN);
decode_results results;

//빗방울, 불꽃감지 센서
int rain_pin = A0;
int fire_pin = 13;
 

 

//모터 작동 관련 함수

void open_window()
{
  close_state = 0;
  int val = digitalRead(11);
  if(val == HIGH){
    digitalWrite(in1,HIGH);
    digitalWrite(in2,LOW);
    analogWrite(speed_pin, speed_n);
    while(digitalRead(11) == HIGH)
    {
    }
    delay(del);
    stop_motor();
  }
}

void close_window()
{
  close_state = 1;
  int val = digitalRead(10);
  if(val == HIGH){
    digitalWrite(in1,LOW);
    digitalWrite(in2,HIGH);
    analogWrite(speed_pin, speed_n);
    //LOW일때 빠져나옴(10번 마그네틱이 서로 맞닿았을때)
    while(digitalRead(10) == HIGH)
    {
    }
    stop_motor();
  }

}

void stop_motor()
{
    digitalWrite(in1,LOW);
    digitalWrite(in2,LOW);
}


//wifi 통신 관련 함수
void connect_wifi(int i)
{
  String cmd = "AT+CIPSTART=\"TCP\",\"";
  cmd += Address;
  cmd += "\",80";
  esp_wifi.println(cmd);
  if(esp_wifi.find("Error")){
    Serial.println("TCP connect error");
    return;
  }
  cmd = "GET http://";
  cmd += Address;
  if(i==1)
    cmd += "/fcm/window_warning.php\n\r";
  else if(i==2)
    cmd += "/fcm/fire_warning.php\n\r";
  esp_wifi.print("AT+CIPSEND=");
  esp_wifi.println(cmd.length());

  Serial.println(cmd);

  if(esp_wifi.find(">"))
  {
    Serial.print(">");
  }
  else{
    esp_wifi.println("AT+CIPCLOSE");
    Serial.println("connect timeout");
    return;
  }

  esp_wifi.print(cmd);
  delay(2000);
  while(Serial.available())
  {
    char c = Serial.read();
    esp_wifi.write(c);
    if(c=='\r')
      esp_wifi.print('\n');
  }
  Serial.println("====");
  esp_wifi.println("AT+CIPCLOSE");
  delay(1000);
}

// 셋업 & 루프
void  setup ( )
{
  irrecv.enableIRIn();  // Start the receiver
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
  pinMode(10,INPUT_PULLUP);  //마그네틱 센서
  pinMode(11,INPUT_PULLUP);  //마그네틱 센서
  pinMode(13, INPUT);
  esp_wifi.begin(9600);
  Serial.begin(9600);   // Status message will be sent to PC at 9600 baud
}


void  loop ( )
{
  int rain_val = analogRead(rain_pin);
  int fire_val = digitalRead(fire_pin);
  unsigned int num;
  
  if (irrecv.decode(&results)) 
  {  // Grab an IR code
    
    if(results.value == 33457275) //리모컨 1번
    {
        open_window();
    }
    else if(results.value == 33473595) //리모컨 3번
    {
       close_window();
    }
    irrecv.resume();
  }
  
  if(fire_val == HIGH && rain_val <=600)
  {
     open_window();
     Serial.println("open window");
     if(fire_push == 0){
      connect_wifi(2);
      fire_push = 1;
     }
  }
  else if(rain_val <= 600)
  {
    close_window();
  }
  else if(fire_val == HIGH)
  {
    open_window();
    if(fire_push == 0){
      connect_wifi(2);
      fire_push = 1;
     } 
  }
  else{
    fire_push = 0;
  }
  
  //close_state가 1일땐 닫혀있어야함. 
  if(digitalRead(10) != LOW && close_state == 1)
  {
    if(push == 0){
      connect_wifi(1); 
      push = 1;
    }    
  }
  else{
    push = 0;
  }
}








