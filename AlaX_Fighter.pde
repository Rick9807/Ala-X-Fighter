import processing.sound.*;
PImage aliado, en1, en2, fondo, misil;
SoundFile MFondo, MImpacto, MDisparo;
void setup(){
  MFondo = new SoundFile(this,"MusicaFondo.mp3");
  MImpacto = new SoundFile(this,"Impacto.wav");
  MDisparo = new SoundFile(this,"Disparo.wav");
  size(600,800);
  aliado = loadImage("Ala-X.png");
  en1 = loadImage("Tie.png");
  en2 = loadImage("Tie Vader.png");
  fondo = loadImage("Fondo.jpg");
  misil = loadImage("Proyectil.png");
  background(fondo);
  frameRate(10000);
  MFondo.play();
}
int x1, y1;
int x2 = 255, y2 = 730;
int i = -200;
float incX, aux = -200, disparos = 0, hits = 0, puntaje = 0;
float movX1=20, movY1=20, movX2= 300, movY2=0, incX1=1, incY1=1, incX2=random(1,15), incY2=random(1,5);
boolean banderaX1=true, banderaY1=true, banderaX2=true, banderaY2=true, arma = true;
  void mouseClicked(){
    x1 = mouseX;
    y1 = mouseY;
    i = y2;
    incX = x1 - x2;
    incX = incX/(y2 - y1);
    aux = x2;
    disparos++;
    MDisparo.play();
    arma = !arma;
  }
void draw(){
  if(arma)
    x2 = 255;
    y2 = 730;
  if(!arma)
    x2 = 332;
    y2 = 730;
  background(fondo);
  incX2=random(1,3);
  incY2=random(1,3);
  image(en1,movX1,movY1,50,50);
  image(en2,movX2,movY2,50,50);
  if(movX1 > 550 || movX1 < 0)
    banderaX1 = !banderaX1;
  if(movX2 > 550 || movX2 < 0)
    banderaX2 = !banderaX2;
  if(movY1 > 600 || movY1 < 0)
    banderaY1 = !banderaY1;
  if(movY2 > 600 || movY2 < 0)
    banderaY2 = !banderaY2;
  movX1 = banderaX1 ? movX1+incX1 : movX1-incX1;
  movX2 = banderaX2 ? movX2+incX2 : movX2-incX2;
  movY1 = banderaY1 ? movY1+incY1 : movY1-incY1;
  movY2 = banderaY2 ? movY2+incY2 : movY2-incY2;
  if(movX2 > 600)
    movX2 = 300;
  if(movX2 < -50)
    movX2 = 300;
  if(movY2 > 650)
    movY2 = 300;
  if(movY2 < -50)
    movY2 = 300;
  text("Disparos:  "+disparos, 2, 12);
  text("Hits:  "+hits, 2, 25);
  text("Puntaje:  "+puntaje, 2, 38);
  image(aliado, 260,720, 80 ,80);
  image(misil, aux, i, 15, 30);
  if((aux>=movX1-15 && aux <=movX1+50) && (i>=movY1 && i<=movY1+50)){
    MImpacto.play();
    hits++;
    background(255,0,0);
    aux=-50;
    i=-50;
  }
  if((aux>=movX2-15 && aux <=movX2+50) && (i>=movY2 && i<=movY2+50)){
    MImpacto.play();
    hits+=10;
    background(255,0,0);
    aux=-50;
    i=-50;
  }
  puntaje = hits/disparos;
  aux += incX;
  i-=1;
}
