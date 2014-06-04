Animation animation1;

float xpos;
float ypos;
float speed;
float gravity;

void setup() {
  background();
  frameRate(14);
  animation1 = new Animation("limbo", 11);
  xpos = 100;
  ypos = 0;
  speed = 0;
  gravity = 2.0;
}

void draw() { 
  // Display the sprite at the position xpos, ypos
    background();    
    animation1.display(xpos, ypos);
    ypos = ypos + speed;
    speed = speed + gravity;
    
    if(speed < 0.65 && ypos > 370){
      speed = 0;
      gravity = 0;
    }
    else if(ypos > 370){
      speed = speed * -.65;
    }
}
