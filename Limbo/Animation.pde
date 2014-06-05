
// Class for animating a sequence of GIFs
class Animation {
  PImage[] images;
  int imageCount;
  int frame;

  Animation(String imagePrefix, int count) {
    imageCount = count;    images = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  int i = 0;  
  float currentPlace = 0;
  void display(float xpos, float ypos) {
    
    //prior to any keys being pressed
    if (keyCode == 0 && (!keyPressed)) {
      frame = (frame + 1) % (imageCount);
      image(images[0], xpos + (i*13), ypos);
    }

    //Right movement
    if (keyCode == RIGHT && keyPressed) {  
      frame = (frame+1) % (imageCount);
      image(images[frame], xpos + (i* 13), ypos);
      i++;
    } else  if (keyCode == RIGHT && (!keyPressed)) {  
      image(images[2], xpos + (i * 13), ypos);
    }
  }

  int getWidth() {
    return images[0].width;
  }
}

