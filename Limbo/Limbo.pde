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
Land land;

void setup() {
  background();
  frameRate(11);
  minim = new Minim(this);
  Tack = new Animation("limbo", 11); 
  Cloud = new Cloudy("frame_", 50);
  player = minim.loadFile(songs.get(0), 4000);
  lightning = minim.loadFile(songs.get(2), 4000);
  player.play();
  land = new Land(500, 0);
  newLand = new Land(250, 0);
  xpos = 200;
  ypos = land.getY((int) Tack.x) - 81;
  speed = 0;
  gravity = 2.0;
  f = createFont("BillionStars", 16, true);
  blood = loadImage("Bolt.gif"); 
  stroke(0);
  noFill();
}

void draw() { 
  // Display the sprite at the position given
  background();
  if (mousePressed) {
    if (mouseX > 500 && mouseX < 550 && mouseY>300 && mouseY<350) {
      dead = false;
      keyCode = RIGHT;
      Tack.x = 200;
    }
  }
  if (dead == false) {
    Tack.display(xpos, land.getY((int)Tack.x) - 81);
      lightning.rewind();
  }
  land.display();
  Cloud.display(0, 0);
  rect(500, 300, 50, 50);
  fill(0);
  textFont(f);
  text("LIMBO", 500, 100);
  if (Tack.x < 50 && keyCode == LEFT) {
    lightning.play();
    image(blood, Tack.x, ypos - 400);
    Cloud.display(0, 0);
    land.display();
    System.out.println(Tack.x);
    Tack.die();
  }
} 

