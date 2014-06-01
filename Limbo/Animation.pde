
// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];


    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }
int i = 0;
  void display(float xpos, float ypos) {
if(keyCode == RIGHT && keyPressed){  
    frame = (frame+1) % (imageCount);
    image(images[frame], xpos + (i* 10), ypos);
    i++;
  }else{
    image(images[0], xpos + (i * 10), ypos);
  }
  }
  
  int getWidth() {
    return images[0].width;
  }
}
