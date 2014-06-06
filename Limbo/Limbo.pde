Animation Tack;
Land land;
import ddf.minim.*;
AudioPlayer player;
AudioPlayer rain;
Minim minim;

float xpos;
float ypos;
float speed;
float gravity;
PFont f;

void setup() {
  background();
  frameRate(11);
  minim = new Minim(this);
  player = minim.loadFile("Limbo.mp3", 40000);
  player.play();
  Tack = new Animation("limbo", 11); 
  land = new Land(500, 0);
  xpos = 200;
  ypos = land.getY((int)Tack.x) - 81;
  speed = 0;
  gravity = 2.0;
  f = createFont("Limbo", 16, true);  
}

void draw() { 
  // Display the sprite at the position xpos, ypos
  
    background();
    Tack.display(xpos, land.getY((int)Tack.x) - 81);    
    land.display();
    ypos = ypos + speed;
    speed = speed + gravity;  
    
   /*  if(speed < 0.65 && ypos > land.getY((int)Tack.x - 87)){
      speed = 0;
      gravity = 0;
    }
    else if(ypos > 835 - land.h){
      speed = speed * -.65;
    }*/
    fill(0);
    text("LIMBO" , 500, 300);
}
