void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial1.begin(115200);
  
  setPos(0);
}


// 0x0 = set position (signed)
// 0x1 = get position
// 0x2 = set velocity (signed)
// 0x3 = get velocity
// 0x4 = set max current


int32_t setPos(int32_t pos){
  uint32_t command = 0x01; // differentiates different commands
  uint8_t buf[4];
  buf[0] = command;
  buf[1] = (pos>>16) & 0x000000FF;
  buf[2] = (pos>>8) & 0x000000FF;
  buf[3] = (pos & 0x000000FF);

  Serial1.write(buf, 4);
  
  return 0;
}


int32_t setVel(int32_t vel){
  uint32_t command = 0x04; // differentiates different commands
  uint8_t buf[4];
  buf[0] = command;
  buf[1] = (vel>>16) & 0x000000FF;
  buf[2] = (vel>>8) & 0x000000FF;
  buf[3] = (vel & 0x000000FF);

  Serial1.write(buf, 4);
  
  return 0;
}

//current range: 0-31
int32_t setCur(uint32_t cur){
  uint32_t command = 0x0F; // differentiates different commands
  uint8_t buf[4];
  buf[0] = command;
  buf[1] = 0;
  buf[2] = 0;
  buf[3] = (cur & 0x000000FF);

  Serial1.write(buf, 4);
  
  return 0;
}

int32_t getPos(void){
  uint8_t command = 0x02; // get position command
  uint8_t buf[4];
  buf[0] = command;
  buf[1] = 0;
  buf[2] = 0;
  buf[3] = 0;
  
  int8_t pos_arr[3];
  
  Serial1.write(buf, 4);
  
  // wait to receive 3 bytes of data
  while(Serial1.available() == 0);
  pos_arr[2] = Serial1.read();
//  Serial.print("1st byte");
//  Serial.println(pos_arr[2], HEX);
  while(Serial1.available() == 0);
  pos_arr[1] = Serial1.read();
//  Serial.print("2nd byte");
//  Serial.println(pos_arr[1], HEX);
  while(Serial1.available() == 0);
  pos_arr[0] = Serial1.read();
//  Serial.print("3rd byte");
//  Serial.println(pos_arr[0], HEX);

  Serial.println(pos_arr[0]);
  Serial.println(pos_arr[0]);
  Serial.println(pos_arr[0]);
  
    
  int32_t pos_val = ((pos_arr[2] << 16) & 0x00FF0000) | ((pos_arr[1] << 8) & 0x0000FF00) | ((pos_arr[2]) & 0x000000FF); 

  if(pos_val & 0x00800000 != 0x0){
      pos_val |= 0xFF;
    }

  Serial.print("position ");
  Serial.println(pos_val);
  
  return 0;
}

int32_t getVel(void){
  uint8_t command = 0x08; // get position command
  uint32_t uart_out = ((command << 24) & 0xFF000000);

  uint8_t vel_arr[3];

  Serial1.print(uart_out);

  // wait to receive 3 bytes of data
  while(Serial1.available() == 0);
  vel_arr[2] = Serial1.read();
  while(Serial1.available() == 0);
  vel_arr[1] = Serial1.read();
  while(Serial1.available() == 0);
  vel_arr[0] = Serial1.read();
    
  uint32_t vel_val = (vel_arr[2] & 0x00FF0000) | (vel_arr[1] & 0x0000FF00) | (vel_arr[0] & 0x000000FF);

  //check if negative
  if((0x00800000 & vel_val)>>23){
    vel_val |= 0x80000000;
  }

  int32_t signed_vel_val = vel_val;

  Serial.println(signed_vel_val);
  
  return 0;
}

//current = 5 bit unsigned value
int32_t setCurrent(uint8_t current){
  uint8_t command = 0xFF; // differentiates different commands
  uint32_t uart_out = ((command << 24) & 0xFF000000) | (current & 0x0000001F);

  Serial1.print(uart_out);

  Serial.print("Set current to ");
  Serial.print(current+1);
  Serial.print("/32");
  
  return 0;
}



void loop() {
  // put your main code here, to run repeatedly:


  String incoming;
  String command;
  String value_str;

  while(Serial.available() == 0);
  incoming = Serial.readString();

  Serial.println(incoming);
  command = incoming.substring(0, 2);
  value_str = incoming.substring(3, incoming.length()-1);

  int32_t value = value_str.toInt();

  if(command == "sp"){
    setPos(value);
  }
  else if(command == "gp"){
//    getPos();
  }
  else if(command == "sv"){
    setVel(value);
  }
  else if(command == "sc"){
    setCur(value);
  }

  
//  setPos(26400);
//  delay(5000);
//  setPos(0);
//  delay(5000);
//
//    setVel(-160);
//    delay(10000);

  
//  delay(5000);
//  setPos(-26400);
//  delay(5000);

//  if((0x00FFFFFF & 0x00800000) >> 23){
//    Serial.println("True");
//  }
//  else{
//    Serial.println("F");
//  }

  

//  setPos(100);
//  for(uint32_t i=0; i<10; i++){
//    Serial.println(i);
//    Serial1.println(i);
//    delay(500);
//  }
}
