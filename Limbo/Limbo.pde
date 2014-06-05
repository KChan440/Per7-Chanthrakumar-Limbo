Animation Tack;
Animation Tack2;


float xpos;
float ypos;
float speed;
float gravity;

void setup() {
  background();
  frameRate(11);
  Tack = new Animation("limbo", 11);
  xpos = 200;
  ypos = 0;
  speed = 0;
  gravity = .0;
}

void draw() { 
  // Display the sprite at the position xpos, ypos
    background();
    Tack.display(xpos, ypos);
    ypos = ypos + speed;
    speed = speed + gravity;  
    if(speed < 0.65 && ypos > 800){
      speed = 0;
      gravity = 0;
    }
    else if(ypos > 800){
      speed = speed * -.65;
    }
}
