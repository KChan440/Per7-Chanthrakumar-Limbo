Animation Tack;
Land land;

float xpos;
float ypos;
float speed;
float gravity;

void setup() {
  background();
  frameRate(11);
  Tack = new Animation("limbo", 11); 
  land = new Land(200, 0);
  xpos = 200;
  ypos = 0;
  speed = 0;
  gravity = 2.0;
}

void draw() { 
  // Display the sprite at the position xpos, ypos
  
    background();
    Tack.display(xpos, ypos);
    land.display();
    ypos = ypos + speed;
    speed = speed + gravity;  
    
     if(speed < 0.65 && ypos > land.getY(0)){
      speed = 0;
      gravity = 0;
    }
    else if(ypos > land.getY(0)){
      speed = speed * -.65;
    }
}
