static int level = 0;
import java.util.LinkedList;
Animation Tack;
Animation Cloudy;
Cloudy Cloud;
Land newLand;
import ddf.minim.*;
AudioPlayer player;
AudioPlayer lightning;
Minim minim;

float xpos;
float ypos;
float speed;
float gravity;
PFont f;
PImage blood;
PImage bg;
PImage angel;
PImage sword;
float offset = 0;
float easing = 0.05;
boolean cutscene = true;
Land land;

void setup() {
  background();
  frameRate(11);
  minim = new Minim(this);
  Tack = new Animation("limbo", 11); 
  Cloud = new Cloudy("frame_", 50);
  player = minim.loadFile(songs.get(0), 4000);
  lightning = minim.loadFile(songs.get(2), 4000);
  angel = loadImage("Angel.png");
  //player.play();
  land = new Land(500, 0);
  newLand = new Land(250, 0);
  xpos = 200;
  ypos = land.getY((int) Tack.x) - 81;
  f = createFont("BillionStars", 16, true);
  blood = loadImage("Bolt.gif"); 
  bg = loadImage("Limbo.jpg");
  sword = loadImage("sword.png");
  stroke(0);
  noFill();
}

void draw() { 
  // Display the sprite at the position given
  background(bg);  
    textFont(f);
    image(angel, 900, 40);
 // player.rewind();
  player.play();
if(level == 0){
  land.display();
  Tack.display(xpos, land.getY((int)Tack.x) - 85);
  if(Tack.x < 600 && Tack.x > 300){
  String text = "Tack...your journey has begun.  Your journey...to move on.";  
  text(text, 500, 100);
  }
  if(Tack.x > 1000){
    level++;
    Tack.display(xpos, land.getY((int)Tack.x) -81);
  }
}


if(level == 1){
  text("Click on me to spawn.", 700, 100);
image(sword, 800, land.getY((int) 800) - 81);
  if (dead == false) {
    Tack.display(200, land.getY((int)Tack.x) - 81);
      lightning.rewind();
  }
    if (mousePressed) {
    if (mouseX > 890 && mouseX < 940 && mouseY > 30 && mouseY < 70) {
      dead = false;
      Tack.x = 200;
    }
  }
  land.display();
  Cloud.display(0, 0);
  if (Math.random()* 100 < 2.) {
    lightning.play();
    image(blood, Tack.x, ypos - 400);
    Cloud.display(0, 0);
    land.display();
    System.out.println(Tack.x);
    Tack.die();
  }
}

} 

