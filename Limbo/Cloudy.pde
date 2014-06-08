class Cloudy extends Animation{
  PImage[] Cloudy;
  int imageCount;
  int frame;
  String filename;
  
 Cloudy(String imagePrefix, int count){ 
   imageCount = count;
   Cloudy = new PImage[imageCount];
   for(int i=0; i < imageCount; i++){
     filename = imagePrefix + nf(i, 3) + ".gif";
     Cloudy[i] = loadImage(filename);
   }
 }
 
 void display(int xpos, int ypos){
   frame = (frame + 1) % (imageCount);
      image(Cloudy[frame], xpos, ypos); 
  }
}
