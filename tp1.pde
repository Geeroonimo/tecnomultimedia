import ddf.minim.*; //Importación de libreria de audio

Minim minim;
AudioPlayer audio;
PImage kratos, kratos2, kratos3, kratos4, zeus, godofwar;
PFont FuenteNueva;
String textoama, texto1, texto2, textoama2, texto3, textoama3 = "";

int t = 50, t2= 100, colort;
float posX, posX2, posX3, posY, posY2, posY3, posYima, posYimaK, vel, au, au2;

void setup(){
background(0);
size(1920, 1080 );
kratos = loadImage("Kratos.jpg");
godofwar = loadImage("Godofwar.png");
kratos2 = loadImage("KRatosss.jpg");
kratos3 = loadImage("kratossss.jpg");
kratos4 = loadImage("kratos3.jpg");
zeus = loadImage("zeus.jpg");
minim = new Minim(this); //Declarando objeto tipo minim (el reproductor de audio)
audio= minim.loadFile("GodOfWar.wav"); //Cargando archivo .wav
textoama = "           SONY COMPUTER ENTERTAINMENT AMERICA \n\n                          SANTA MONICA STUDIO";
texto1 = "\n\n\n                             GAME DIRECTOR                   STIG ASMUSSEN \n\n\n\n                     SENIOR PRODUCER                   STEVE SCAT CATERSON \n\n\n\n                     LEAD PROGRAMMER                     VASSILY FILIPPOV \n\n\n\n                         ART DIRECTOR                          KEN FELDMAN \n\n\n\n                           DESING DIRECTOR                   TODD PAPY    \n\n\n\n                  DIRECTORS OF TECHNOLOGY         CHRISTER ERICSON  \n\n                                                                       TIM MOSS     \n\n\n                 DIRECTOR OF PRODUCT DEVELOPMENT      JOHN HIGHT";
textoama2 = "PROGRAMMING";
texto2 = " \n\n\nPROGRAMMERS                   MATT ARRINGTON \n\n\nAMIT BAKSHI \n\n\nMOUMINE BALLO   \n\n\nJHON BUTTERFIELD  \n\n\nJEFF CHAN \n\n\nMAGNUS DANIELSSON \n\n\nBEN DIAMAND \n\n\nGLENN FIEDLER  \n\n\nTHOMAS MILLER |V \n\n\nFABRICE ODERO   \n\n\nWILLIAM PARKS \n\n\nCEDRIC PERTHUIS \n\n\nERIC SMOLIKOWSKI \n\n\nBOB SPOER \n\n\nJIM TILANDER \n\n\nPHIL WILKINS \n\n";
textoama3 = "\n\n\n                                             DESIGN      ";
texto3 = "\n\n\nLEVEL DESIGNERS        JONATHAN HAWKINS \n\nJUSTIN HENDRY \n\nKEITH NAKAMURA \n\nCHRIS O'NEILL \n\nJEREMY PARKER \n\nWARREN PRICE \n\nQUENTIN RAMSEY \n\nLUIS R. SANCHEZ \n\nJO WRIGHT \n\n\n\nCOMBAT AND SYSTEMS DESIGNERS       ADAM PUHL - LEAD \n\nJASON DE HERAS\n\nTONY HUYNH\n\nJASON D.MCDONALD\n\nALEX SULMAN\n\nBRIAN KA CHUN YU\n\n\nCAMERA DESIGNERS    MARK SIMON - LEAD\n\nMATHIEU FALLOWS\n\nJOSH HARRISON\n\nSTEVE PETERSON\n\n";

t = t - 25; //tamaño 1 
t2 = t2 - 70; //tamaño 2 para textos principales
colort= 255;

au= 0;
au2 = 0;
posX = -120;
posX2 = 125;
posX3 = 30;

posY = 1200;
posY2 = 2250;
posY3 = 3200;
posYima = 5150;
posYimaK = 0;
vel = 2.5;//velocidad

}
void draw()
{
//Condición para que se produzca el efecto de desplazamiento (reinicio)
//if((posY <= -100)&&(posY2 <= -100)&&(posY3 <= -100)&&(posYima <= -250)) //Condición para posicionar los textos
//{ 
//posY = 1150;
//posY2 = 2200;
//posY3 = 3125;
//posYima = 5250;
//}

if(posYimaK == 0) 
{ 
image(kratos, 20, 0, 1920 , 1080);
au = au + 0.60; // -
} 
if(au >= 255) //modificar 150 a 255 para oscurecerlo por completo
{
au = 0;
} //-
if(posY <= -65) 
{ 
image(kratos2, 850, 0, 1080 , 1060);
}
if(posY2 <= -280)
{
image(kratos3, 850, 0, 1080 , 1060);
}
if(posY2 <= -1550)
{
au2 = au2 + 1;
image(zeus, 850, 0, 1080 , 1060);
}
if(posY3 <= -1550) 
{ 
au = 0;
image(kratos4, 0 , 0, 1920 , 1080);
}
if(posYima <= 400) // Condición para que el desplazamiento se detenga en el final
{ 
vel = 0;
}

if(mouseX >=1000)
{ 
 colort = 255;
}
else if (colort == 255)
{ 
 colort = #FA0000;
}

if(keyPressed) //Si se presiona una de las siguientes teclas
{ 
if(key == '1') 
{ 
 audio.play(); // Reproduce el audio
} 
else if(key == '2')
{ 
audio.pause(); // Pausa el audio
audio.rewind(); // Reinicia el audio desde 0
}
}

//Asignando velocidades a los ejes Y
posY -= vel;
posY2 -= vel;
posY3 -= vel;
posYima -= vel;// ima (imagen)


// rectangulo que se oscurese
fill(au2, au); 
strokeWeight(0);
rect(850, 0, 1080, 1060 );

//rectangulo negro
fill(0); 
strokeWeight(0);
rect(0, 0, 850, 1100 );

//triangulo negro
fill(0); 
strokeWeight(0);
triangle(1130, 0, 850, 1060, 800, 0);

//triangulo rojo
fill(colort); 
strokeWeight(0);
triangle(1125, 0, 815, 1200, 1150, 0);

//textos
fill(#FA9D12);
textSize( t2 );
text(textoama, posX + 50, posY-70);

fill(255);
textSize( t );
text(texto1, posX, posY);


fill(#FA9D12);
textSize( t2 );
text(textoama2, posX + 450, posY2-150);

fill(255);
textSize( t );
text(texto2, posX2, posY2-100);


fill(#FA9D12);
textSize( t2 );
text(textoama3, posX + 20, posY3 + 150);

fill(255);
textSize( t );
text(texto3, posX3, posY3 + 250);

image(godofwar, random(120, 125), posYima, 720 , 250); //Logo de Godofwar

FuenteNueva = loadFont("GodOfWar-32.vlw"); // Colocación de la fuente
textFont(FuenteNueva);
  

}
