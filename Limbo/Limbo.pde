import java.util.LinkedList;
Animation Tack;
Land land;
Land newLand;
import ddf.minim.*;
AudioPlayer player;
AudioPlayer rain;
Minim minim;

float xpos;
float ypos;
float speed;
float gravity;
PFont f;
int s = 0;


void setup() {
  background();
  frameRate(11);
  minim = new Minim(this);
  Tack = new Animation("limbo", 11); 
 /* player = minim.loadFile(songs.get(0), 40000);
  player.play();*/
  land = new Land(500, 0);
  newLand = new Land(550, 0);
  xpos = 200;
  ypos = land.getY((int)Tack.x) - 81;
  speed = 0;
  gravity = 2.0;
  f = createFont("BillionStars", 16, true);  
}

void draw() { 
  // Display the sprite at the position given
    background();
    Tack.display(xpos, land.getY((int)Tack.x) - 81);    
    land.display();
    fill(0);
    textFont(f);
    text("LIMBO" , 500, 100);
    if(Tack.x > 1000 && keyPressed){
      Tack.x = 0;
    }
    if(!(Tack.x > 10)){
      Tack.x = 1000;
    }

}



