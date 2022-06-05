// Video : https://www.youtube.com/watch?v=yxj_xj9oSNE

void setup() 
{
size(600, 600);
rectMode(RADIUS); // Ubica todos los rectangulos con respecto al radio del centro de la pantalla
}
void draw() {
background(255);

for(int c=1000; c>0; c-=20) //valor inicial, limites, asignación
{
fill(random(0, 255), random(0, 255), 255);
circle(300, 300, c);
}

translate(width/2,height/2); //Ubica la rotación de lo rectangulos respecto al centro de la pantalla
for (int i=0; i<width; i++) 
{
rotate(300); // Giro los rectangulos alrededor de su posición de origen

fill(150, random(0, 255), 255);

rect(mouseX, mouseY, 30, 30);

rect(mouseX - 150, mouseY - 150, 40, 40);

rect(mouseX - 300, mouseY - 300, 50, 50);

rect(mouseX - 450, mouseY - 450, 60, 60);
}

if (keyPressed)
{
if (key =='r' || key == 'R' ) //Reinicio las variables a 0 para que vuelvan a sus condiciones iniciales
{
mouseX = 0;
mouseY = 0;
}
  
}

}
 
