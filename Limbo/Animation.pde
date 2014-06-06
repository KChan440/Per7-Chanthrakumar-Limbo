// Class for animating a sequence of GIFs
class Animation {
  PImage[] Tack;
  int imageCount;
  int frame;
  float x;
  float y;
  boolean moved;
  String filename;

  Animation(String imagePrefix, int count) {
    imageCount = count;    
    Tack = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      filename = imagePrefix + nf(i, 4) + ".png";
      Tack[i] = loadImage(filename); 
  }
  }

  int i = 0;  

  void move( Displaceable l , int divisor )
  {
    int amt = int(speed/constrain(divisor,1,1000));
    if( amt > 0 )
    {
      l.displace( amt );
    }
  }

  void display(float xpos, float ypos) {

    //prior to any keys being pressed
    if (keyCode == 0 && (!keyPressed)) {
      frame = (frame + 1) % (imageCount);
      image(Tack[1], xpos + (i*5), ypos);
      moved = false;
    }

    //Right movement if not moved
    if (keyCode == RIGHT && keyPressed && (!moved) ) {
      xpos = xpos + (i*3);  
      i++;
      frame = (frame+1) % (imageCount);
      image(Tack[frame], xpos, ypos);
      x = xpos;
    } else if (keyCode == RIGHT && (!keyPressed) && (!moved)) {  
      image(Tack[2], x, ypos);
      moved = true;
    }

    //Right movement if moved before
    if (keyCode == RIGHT && keyPressed && moved) {
      frame = (frame + 1 )%(imageCount);
      image(Tack[frame], x, ypos);
      x += 2;
    } else if (keyCode == RIGHT && (!keyPressed) && moved) {
      image(Tack[2], x, ypos);
    }

    // movement if moved before
    if (keyCode == LEFT && keyPressed && moved) {
      frame = (frame+1) % (imageCount);
      image(Tack[frame], x, ypos);
      x -= 2;
    } else if (keyCode == LEFT && (!keyPressed)) {
      this.filename = "limbo";
      image(Tack[2], x, ypos);
    }
  }

  int getWidth() {
    return Tack[1].width;
  }
}
  
