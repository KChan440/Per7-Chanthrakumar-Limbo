static int level = -1;
import java.util.*;
Animation Tack;
Animation Cloudy;
Cloudy Cloud;
Land newLand;
import ddf.minim.*;
AudioPlayer song0;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer newSong;
AudioPlayer lightning;
AudioPlayer roar;
AudioPlayer boss;
Minim minim;

int s=0;
float xpos;
float ypos;
float speed;
int cloudHealth = 200;
int myHealth = 200;
int ineedThis = 0;
int numBalls = 20;
PFont f;
PImage blood;
PImage bg;
PImage angel;
PImage sword;
PImage Limbo;
float offset = 0;
float easing = 0.05;
boolean cutscene = true;
boolean fightable = false;
Land land;
LinkedList<AudioPlayer> music = new LinkedList<AudioPlayer>();

void setup() {
  size(1000,1000);
//  background();
  frameRate(13);
  minim = new Minim(this);
  Tack = new Animation("limbo", 11); 
  Cloud = new Cloudy("frame_", 50);
  lightning = minim.loadFile("lightning.mp3", 4000);
  roar = minim.loadFile("Cloud.mp3", 4000);
  boss = minim.loadFile("Sepiroth.mp3", 4000);
  song0 = minim.loadFile("Level0.mp3", 4000);
  song1 = minim.loadFile("Leaves.mp3", 4000);
  song2 = minim.loadFile("My Song.mp3", 4000);
  song3 = minim.loadFile("Arurian Dance.mp3", 4000);
  music.add(song0);
  music.add(song1);
  music.add(song2);
  music.add(song3);
  angel = loadImage("Angel.png");
  Limbo = loadImage("limbo.png");
  land = new Land(500, 0);
  newLand = new Land(250, 0);
  xpos = 200;
  ypos = land.getY((int) Tack.x) - 81;
  f = createFont("LIMBO", 16, true);
  blood = loadImage("Bolt.gif"); 
  bg = loadImage("Limbo.jpg");
  sword = loadImage("sword.png");
  stroke(0);
  noFill();
}

void draw() { 
  
  if(level == -1){
background(0);
text("Kumaran Presents:", 700, 100);
image(Limbo, 250, 300);
text("Press any key to continue" ,300, 300);
music.get(s).play();
if(keyPressed){
  level = 0;
}
  }
  // Display the sprite at the position given
if (level != -1){
  background(bg);
  if (myHealth <= 0) {
    Tack.die();
  }
  text("HP: " + myHealth, (int) Tack.x - 80, land.getY((int)Tack.x) - 120); 
  if (keyCode == SHIFT && keyPressed) {
    music.get(s).pause();
    s++;
  }
  textFont(f);
  image(angel, 900, 40);
  music.get(s).play();
  // player.rewind();
  if (level == 0) {
    land.display();
    Tack.display(xpos, land.getY((int)Tack.x) - 85);
    if (Tack.x < 600 && Tack.x > 300) {
      // String text = "Tack...your journey has begun.  Your journey...to move on.";  
      text("Tack...", 500, 100);
    }
    if (Tack.x < 680 && Tack.x>600) {
      text("Your journey....", 500, 200);
    }
    if (Tack.x<780 && Tack.x > 685) {
      text("Has begun", 500, 200);
    }
    if (Tack.x >= 900) {
      level = 1;
      ineedThis = 1;
    }
  }

  if (level == 1) {  
    text("Who is awesome?\nA)Kumaran\nB)Wrong.", 700, 100);
    text("This is when I'll start explaining my code and stuff before the final boss", 300, 300);
    land.display();
    Tack.display(200, land.getY((int)Tack.x) - 85);
    if(key == 'a' || key == 'b'){
      ineedThis = 2;
    }
    if (ineedThis == 2) {
      level++;
    }
  }

  if (level == 2) {
    music.get(s).pause();
    boss.play();
    text("Click on me to spawn.", 700, 100);
    image(sword, 200, land.getY((int) 800) - 81);
    if (dead == false) {
      Tack.display(200, land.getY((int)Tack.x) - 81);
      lightning.rewind();
    }
    if (mousePressed) {
      if (mouseX > 890 && mouseX < 940 && mouseY > 30 && mouseY < 70) {
        dead = false;
        Tack.x = 200;
        myHealth = 200;
      }
    }
    land.display();
    Cloud.display((int) Tack.x - 100, 0);
    roar.play();
    if (Math.random() * 100 < .5) {
      roar.rewind();
      roar.play();
    }
    text("Tack, you have to click on Cloudn\n to lower his health!  Standing still\n increases your chance of being hit!!", 600, 300);
    text("Cloud - HP: " + cloudHealth, (int) Tack.x - 80, 400); 
    if (Tack.x < 800) {
      fightable = true;
    }
    if (mousePressed  && dead == false && fightable == true) {
      if (mouseX > (int) Tack.x - 50 && mouseX < (int) Tack.x + 100 && mouseY > 0 && mouseY < 300) {
        cloudHealth --;
      }
    }
    if (keyCode != RIGHT || keyCode != LEFT && keyPressed) {
      if (Math.random()* 100 < 3.5) {
        lightning.play();
        image(blood, Tack.x, ypos - 400);
        Cloud.display((int) Tack.x, 0);
        land.display();
        System.out.println(Tack.x);
        myHealth -= 15;
      }
    } else {
      if (Math.random()* 100 < 10) {
        lightning.play();
        image(blood, Tack.x, ypos - 400);
        Cloud.display((int) Tack.x, 0);
        land.display();
        System.out.println(Tack.x);
        myHealth -= 20;
      }
    }
  }
  if (cloudHealth <= 0) {
boss.pause();    
music.get(s).play();
    level = -1;
  }
}
} 


