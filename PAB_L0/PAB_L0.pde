PImage logo;

void runBranding() {
  drawPattern(50, 50, 150);
  logo = loadImage("logo.png");
  logo.resize(140, 160);
  image(logo, width/2-70, 20);


  fill(10, 10, 150);
  textAlign(CENTER);
  textSize(32);
  text("PAB_LO", 250, 225);
}

void drawPattern(int r, int g, int b) {
  background(r, g, b);

  stroke(r+20, g+20, b+20);
  strokeWeight(20);
  float value;

  for (int i = 0; i < 20; i++) {
    value = random(-150,150);
    
    line(0, i*50+value, width, i*50);
  }
}
