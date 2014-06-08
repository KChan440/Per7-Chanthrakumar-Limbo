static boolean Left;
static boolean dead = false;
// Class for animating a sequence of GIFs
class Animation {
  PImage[] Tack;
  PImage[] Tack2;
  PImage[] tackDead;
  int imageCount;
  int frame;
  float x;
  float y;
  boolean moved;

  String filename;

  Animation(){
  }

  Animation(String imagePrefix, int count) {
    imageCount = count;    

    Tack2 = new PImage[imageCount];
    for (int i =0; i < imageCount; i++) {
      filename = "limboLeft" + nf(i, 4) + ".png";
      Tack2[i] = loadImage(filename);
    }

    Tack = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      filename = imagePrefix + nf(i, 4) + ".png";
      Tack[i] = loadImage(filename);
    }
  }
    

  int i = 0;  
  
  
  void die(){
    dead = true;
  }

  void display(float xpos, float ypos) {

    //prior to any keys being pressed
    if (keyCode == 0 && (!keyPressed)) {
      frame = (frame + 1) % (imageCount);
      image(Tack[1], xpos, ypos);
      moved = false;
    }

    //Right movement if not moved
    if (keyCode == RIGHT && keyPressed && (!moved) ) {
      Left = false;
      xpos = xpos + (i*2.5);  
      i++;
      frame = (frame+1) % (imageCount);
      image(Tack[frame], xpos, ypos);
      x = xpos;
    } else if (keyCode == RIGHT && (!keyPressed) && (!moved)) {  
      Left = false;
      image(Tack[2], x, ypos);
      moved = true;
    }

    //Right movement if moved before
    if (keyCode == RIGHT && keyPressed && moved) {
      Left = false;
      frame = (frame + 1 )%(imageCount);
      image(Tack[frame], x, ypos);
      x += 2;
    } else if (keyCode == RIGHT && (!keyPressed) && moved) {
      Left = false;
      image(Tack[2], x, ypos);
    }

    // movement if moved before
    if (keyCode == LEFT && keyPressed && moved) {
      Left = true;
      frame = (frame+1) % (imageCount);
      image(Tack2[frame], x, ypos);
      x -= 2;
    } else if (keyCode == LEFT && (!keyPressed)) {
      image(Tack2[2], x, ypos);
    }
  }

  int getWidth() {
    return Tack[1].width;
  }
}

