// CONFIGURA SONIDO : 
int cuenta_en_alto = 2000 ;               // cualquier valor mayor a 1  ( ejemplo 100 , 200 ,  500, 2000 , 5000 ... etc)
int cuenta_total   = cuenta_en_alto*2 ;  

// FUNCION INICIAL DE CONFIGURACION :
void setup() {

  Serial.begin(9600);

  pinMode(6,OUTPUT);   // led rojo
  pinMode(7,OUTPUT);   // led verde
  pinMode(8,OUTPUT);   // buzzer

  digitalWrite(6,LOW);  // rojo
  digitalWrite(7,LOW);  // verde
  digitalWrite(8,LOW);  // Buzzer

}

// FUNCION PRINCIPAL
void loop() {
 
   //sensor 0 - 1024

   int sensor = analogRead(A0);

   // Mensaje en monitor : 
   Serial.print("valor : " ); Serial.println( sensor ); delay(40);

   // VALOR BAJO GAS : verde
   if( sensor >= 2 && sensor <= 300){

     digitalWrite(7,HIGH);
     digitalWrite(6,LOW);
     digitalWrite(8,LOW);
     sound_intermitente(false);

   // VALOR ALTO GAS : rojo 
   }else if( sensor > 300 && sensor <= 1000 ){

     digitalWrite(6,HIGH);
     digitalWrite(7,LOW);
     digitalWrite(8,HIGH);
     sound_intermitente(true);
     
   }
}

int timer_sound = 0 ;

void sound_intermitente( boolean enable ){

    // Si alarma activada :
    if( enable == true ){
      
        if( timer_sound < cuenta_total ){
           timer_sound++;
        }else if( timer_sound >= cuenta_total ){
           timer_sound = 0 ;
        }
        
        // ACTIVA SONIDO
        if( timer_sound <= cuenta_en_alto ){
           digitalWrite(8,HIGH);
        // DESACTIVA SONIDO
        }else{
           digitalWrite(8,LOW);
        }
      
    }
}


