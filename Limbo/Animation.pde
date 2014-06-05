// Class for animating a sequence of GIFs
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  float x;
  float y;
  boolean moved;

  Animation(String imagePrefix, int count) {
    imageCount = count;    
    images = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  int i = 0;  

  void display(float xpos, float ypos) {

    //prior to any keys being pressed
    if (keyCode == 0 && (!keyPressed)) {
      frame = (frame + 1) % (imageCount);
      image(images[1], xpos + (i*5), ypos);
      moved = false;
    }

    //Right movement if not moved
    if (keyCode == RIGHT && keyPressed && (!moved) ) {
      xpos = xpos + (i*3);  
      i++;
      frame = (frame+1) % (imageCount);
      image(images[frame], xpos, ypos);
      x = xpos;
    } else if (keyCode == RIGHT && (!keyPressed) && (!moved)) {  
      image(images[2], x, ypos);
      moved = true;
    }

    //Right movement if moved before
    if (keyCode == RIGHT && keyPressed && moved) {
      frame = (frame + 1 )%(imageCount);
      image(images[frame], x, ypos);
      x += 2;
    } else if (keyCode == RIGHT && (!keyPressed) && moved) {
      image(images[2], x, ypos);
    }

    //Left movement if moved before
    if (keyCode == LEFT && keyPressed && moved) {
      frame = (frame+1) % (imageCount);
      image(images[frame], x, ypos);
      x -= 2;
    } else if (keyCode == LEFT && (!keyPressed)) {
      image(images[2], x, ypos);
    }
  }

  int getWidth() {
    return images[1].width;
  }
}

