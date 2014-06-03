Animation animation1;

float xpos;
float ypos;

void setup() {
  background();
  frameRate(14);
  animation1 = new Animation("limbo", 11);
  ypos = height * 0.25;
}

void draw() { 
  // Display the sprite at the position xpos, ypos
  if (mousePressed) {
    background();
    animation1.display(xpos-animation1.getWidth()/10, ypos);
  } else {
    background();
    animation1.display(xpos-animation1.getWidth()/10, ypos);
  }
}
