import controlP5.*;
import gab.opencv.*;
import java.awt.Rectangle;
PImage[] images;
PImage[] thumbs;


void settings() { 
  size(500, 500);
}

void setup() {
  
  frameRate(30);

  video = new Capture(this, 640, 480, 30);

  images = new PImage[] {loadImage("chaoticWhiteFemale_one.png"), loadImage("chaoticWhiteMale_one.png"), loadImage("controlledBlackMale_one.png"), loadImage("controlledWhiteFemale_one.png")};
  thumbs = new PImage[] {loadImage("chaoticWhiteFemale_one.png"), loadImage("chaoticWhiteMale_one.png"), loadImage("controlledBlackMale_one.png"), loadImage("controlledWhiteFemale_one.png")};
  
  runBranding();
  
  getImage();
  
}

void draw() {
  if (takePicture == true) { //this needs to be in draw which is pretty annoying
    image(video, 0, 0);
  }
}
