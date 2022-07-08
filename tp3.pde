import ddf.minim.*;
Minim minim;
AudioPlayer audio;
int MaxScore = 10;  //Cantidad de score necesaria para ganar

PImage demogorgon, Obstaculos, FondoInicio, FondoEnJuego, FondoInstrucciones, GameOver, YouWin;
PFont FuenteNueva;

String estado;
int i, t, x = -200, y, vy = 0, score = 0;
int wx[] = new int[2], wy[] = new int[2]; // Paredes: wx contiene la distancia horizontal y wy la vertical

void setup() {
  size(600, 700 );
  textAlign( CENTER, CENTER ); //Centra los textos

  minim = new Minim(this); //Declarando objeto tipo minim (el reproductor de audio)
  audio= minim.loadFile("Stranger Things.wav"); //Cargando archivo .wav

  FondoInicio = loadImage("FondoInicio.jpg");
  demogorgon = loadImage("demogorgon.png");
  YouWin = loadImage("YouWin.jpg");
  GameOver = loadImage("GameOver.jpg");
  FondoInstrucciones = loadImage("Instrucciones.jpg");
  FondoEnJuego = loadImage("FondoEnJuego.jpg");
  Obstaculos = loadImage("Obstaculos.png");
  estado = "inicio";

  t= 40; //tamaño de los textos
}

void draw() {
  audio.play();
  if ( estado.equals("inicio") ) {

    imageMode(CORNER);
    image(FondoInicio, 0, 0, 600, 700);
    textSize(t);
    text( "PRESIONE ESPACIO PARA CONTINUAR", width/2, height/2+225 ); 
    //
  } else if (estado.equals("GameOver")) {

    imageMode(CORNER);
    image(GameOver, 0, 0, 600, 700);
    textSize(t);
    text("Puntos alcanzados "+score, width/2-15, 100);
    text( "PRESIONE ENTER PARA REINICIAR", width/2, height/2+225 );
  } else if (estado.equals("YouWin")) {

    imageMode(CORNER);
    image(YouWin, 0, 0, 600, 700);
    textSize(t);
    text( "PRESIONE ENTER PARA REINICIAR", width/2, height/2+225 );
  } else if ( estado.equals("INSTRUCCIONES") ) {
    image(FondoInstrucciones, 0, 0, 600, 700);
    textSize(t-5);
    text( "Para ganar es necesario \n alcanzar 10 puntos por lo que se \n debera de apretar continuamente \n click esquivando los obstaculos \n evitando perder", width/2, height/2-100 );  

    pushStyle();
    if ( dist( mouseX, mouseY, width/2, height/2+150) <= 75 ) {

      fill( 200, 0, 0 );
    } else {
      fill( 255 );
    }
    ellipse( width/2, height/2+150, 150, 150);

    fill(0);
    textSize(t-5);
    text( "CONFIRMAR", width/2+3, height/2+140 );

    popStyle();
  } else if ( estado.equals("jugando") ) {
    imageMode(CORNER);
    image(FondoEnJuego, x, 0);
    image(FondoEnJuego, x+FondoEnJuego.width, 0); 
    x -= 6; //Velocidad del fondo
    vy += 1;//Velocidad del personaje
    y += vy;

    if (x == -1800) { //Condicion para que el fondo se reinicie nuevamente
      x = 0;
    }
    for (i = 0; i < 2; i++) { // BUCLE PARA LA REAPARICIÓN DE LAS PAREDES
      imageMode(CENTER);
      image(Obstaculos, wx[i], wy[i] - (Obstaculos.height/2+100));
      image(Obstaculos, wx[i], wy[i] + (Obstaculos.height/2+100));

      if (wx[i] < 0) {  // Si la pared pasa de largo por la izquierda, se recoloca a la derecha con diferente posición
        wy[i] = (int)random(200, height-200);
        wx[i] = width;
      }
      if (wx[i] == width/2) { // Si el personaje pasa los muros
        score++; // Suma un punto
      }
    //CONDICION DE PERDER
    if ( y>height||y<0||(abs(width/2-wx[i])<25 && abs(y-wy[i])>100)) 
    { 
      
       estado = "GameOver";    // Al chocar contra algo basicamente perdes
      }
      wx[i] -= 6; // La velocidad de los obstaculos se equipara al del mapa
    }
    //CONDICION DE GANAR
    if (score>=MaxScore) // En el momento de que el score sea mayor a maximo de score establecido saltara la pantalla de YouWin
    { 
      estado = "YouWin";
    }

    image(demogorgon, width/2, y, 50, 50);  
    text(""+score, width/2-15, 100); // Contador del score en pantalla
  }
  FuenteNueva = createFont("Fuente.ttf", 100); //Fuente añadida
  textFont(FuenteNueva);
}
void keyPressed() {
  if ( estado.equals("inicio") && key == ' ' ) //Si el estado es igual al inicio y la tecla presionada es espacio:
  { 
    estado = "INSTRUCCIONES"; // Provocara esto
  }

  if ( keyCode == ENTER )  //Condicion para reiniciar utilizando la tecla enter
  {
    if ( estado.equals("GameOver") || estado.equals("YouWin") ) 
    {
      reiniciar();
    }
  }
}

void mousePressed() {
  vy = -17;
  if ( estado.equals("INSTRUCCIONES") && dist( mouseX, mouseY, width/2, height/2+150) <= 75 )  //evento que cambia de instrucciones a jugando
  {
    estado = "jugando";

    wx[0] = 600;
    wy[0] = y = height/2;
    wx[1] = 900;
    wy[1] = 500;
  }
}

void reiniciar() {
  score = 0;
  estado = "inicio";
  x = 0;
}
