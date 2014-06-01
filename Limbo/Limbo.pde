Animation animation1;

float xpos;
float ypos;
float drag = 30.0;

void setup() {
  size(1000, 1000);
  background(255, 204, 0);
  frameRate(10);
  animation1 = new Animation("limbo", 11);
  ypos = height * 0.25;
}

void draw() { 
  float dx = mouseX - xpos;
  xpos = xpos + dx/drag;

  // Display the sprite at the position xpos, ypos
  if (mousePressed) {
    background(153, 153, 0);
    animation1.display(xpos-animation1.getWidth()/10, ypos);
  } else {
    background(255, 204, 0);
    animation1.display(xpos-animation1.getWidth()/10, ypos);
  }
}
