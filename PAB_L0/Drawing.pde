int x;
int y;
int h;
int w;
int centerx;
int centery;
int sf;

String skinHex = "FFDBAC";
float r;
float b;
float g;

float constant0 = 1;
float constant1 = 1.618;
float constant2 = 2.617;

void drawingDriver() {
  setDrawingConstants();
  drawPattern(int(abs(r-255)),int(abs(g-255)),int(abs(b-255)));
  drawBody();
  drawEars();
  drawFace();
  drawEyes();
}
void setDrawingConstants() {
  x = faces[0].x;
  y = faces[0].y;
  h = faces[0].height;
  w = faces[0].width;
  
  skinHex = analyizeFaceColor().substring(2);

  int c = Integer.parseInt(skinHex, 16);
  r = red(c);
  g = green(c);
  b = blue(c);

  centerx = x+(h/2);
  centery = y+(w/2);
  sf = int(((h+w)/2) * .85);

  println("Center Coordinate : " + centerx + "," + centery);

  noFill();
  noStroke();
  //stroke(0, 150, 0); 
  strokeWeight(3);

  line(x, centery, w+x, centery); //horizontal
  line(centerx, y, centerx, h+y); //vertical

  //stroke(255, 0, 0); 

  point(centerx, centery);
}

void drawEyes() {

  for (int i = 0; i < eyes.length; i++) {

    if (eyes[i] != null) {
      if (eyes[i].x < centerx) {
        drawLeftEye(i);
      }
      if (eyes[i].x > centerx) {
        drawRightEye(i);
      }
    }//null check
  }//loop
}

void drawLeftEye(int i) {
  int eyeCenterX = eyes[i].x+(eyes[i].height/2);
  int eyeCenterY = eyes[i].y+(eyes[i].width/2);

  println("print left eye");

  //stroke(255, 0, 0);
  noStroke();
  strokeWeight(3);
  point(eyeCenterX, eyeCenterY);

  //EYEBALL
  noStroke();
  ellipseMode(CENTER);
  fill(255, 192, 203);//pink
  ellipse(eyeCenterX+(sf*.01), eyeCenterY, constant2 * (sf*.06), constant2 * (sf*.05));//pink
  ellipse(eyeCenterX-(sf*.03), eyeCenterY, constant2 * (sf*.06), constant2 * (sf*.05));//pink
  fill(240);//offwhite
  ellipse(eyeCenterX-(sf*.01), eyeCenterY, constant2 * (sf*.065), constant2 * (sf*.05));//ball
  fill(0, 100, 0);//green
  ellipse(eyeCenterX-(sf*.01), eyeCenterY, constant1 * (sf*.05), constant1 * (sf*.05)); //Iris
  fill(20);//offblack
  ellipse(eyeCenterX-(sf*.01), eyeCenterY, constant0 * (sf*.04), constant0 * (sf*.04)); // pupil


  //LIDS
  noStroke();
  fill(r, g, b);
  beginShape();//bottomLid fill
  vertex(eyeCenterX+(sf*.1), eyeCenterY);
  bezierVertex(eyeCenterX-(sf*.03), eyeCenterY+(sf*.045), eyeCenterX+(sf*.02), eyeCenterY+(sf*.045), eyeCenterX-(sf*.12), eyeCenterY);

  vertex(eyeCenterX-(sf*.12), eyeCenterY+(sf*.1));
  vertex(eyeCenterX+(sf*.1), eyeCenterY+(sf*.1));
  endShape();

  stroke(80);
  strokeWeight(1*(sf*.004));
  noFill();
  beginShape();//bottomLid stroke
  vertex(eyeCenterX+(sf*.1), eyeCenterY);
  bezierVertex(eyeCenterX-(sf*.03), eyeCenterY+(sf*.045), eyeCenterX, eyeCenterY+(sf*.045), eyeCenterX-(sf*.12), eyeCenterY);
  endShape();

  //--
  noStroke();
  fill(r, g, b);
  beginShape();//upperLid fill
  vertex(eyeCenterX+(sf*.1), eyeCenterY);
  bezierVertex(eyeCenterX+(sf*.05), eyeCenterY-(sf*.01), eyeCenterX+(sf*.05), eyeCenterY-(sf*.03), eyeCenterX+(sf*.02), eyeCenterY-(sf*.04));
  bezierVertex(eyeCenterX-(sf*.06), eyeCenterY-(sf*.06), eyeCenterX-(sf*.1), eyeCenterY-(sf*.02), eyeCenterX-(sf*.12), eyeCenterY);

  vertex(eyeCenterX-(sf*.12), eyeCenterY-(sf*.1));
  vertex(eyeCenterX+(sf*.1), eyeCenterY-(sf*.1));
  endShape();

  stroke(40);  
  strokeWeight(3*(sf*.004));
  noFill();
  beginShape();//upperLid stroke
  vertex(eyeCenterX+(sf*.1), eyeCenterY);
  bezierVertex(eyeCenterX+(sf*.05), eyeCenterY-(sf*.01), eyeCenterX+(sf*.05), eyeCenterY-(sf*.03), eyeCenterX+(sf*.02), eyeCenterY-(sf*.04));
  bezierVertex(eyeCenterX-(sf*.06), eyeCenterY-(sf*.06), eyeCenterX-(sf*.1), eyeCenterY-(sf*.02), eyeCenterX-(sf*.13), eyeCenterY);
  endShape();

  //BROW
  stroke(40);
  strokeWeight(8*(sf*.004));
  noFill();
  beginShape();
  vertex(eyeCenterX+(sf*.1), eyeCenterY-(sf*.08));
  bezierVertex(eyeCenterX-(sf*.005), eyeCenterY-(sf*.12), eyeCenterX+(sf*.005), eyeCenterY-(sf*.12), eyeCenterX-(sf*.15), eyeCenterY-(sf*.08));
  endShape();
}

void drawRightEye(int i) {
  int eyeCenterX = eyes[i].x+(eyes[i].height/2);
  int eyeCenterY = eyes[i].y+(eyes[i].width/2);

  println("print right eye");

  //stroke(255, 0, 0);
  noStroke();
  strokeWeight(3);
  point(eyeCenterX, eyeCenterY);

  //EYEBALL
  noStroke();
  ellipseMode(CENTER);
  fill(255, 192, 203);//pink
  ellipse(eyeCenterX-(sf*.01), eyeCenterY, constant2 * (sf*.06), constant2 * (sf*.05));//pink
  ellipse(eyeCenterX+(sf*.03), eyeCenterY, constant2 * (sf*.06), constant2 * (sf*.05));//pink
  fill(240);//offwhite
  ellipse(eyeCenterX+(sf*.01), eyeCenterY, constant2 * (sf*.065), constant2 * (sf*.05));//ball
  fill(0, 100, 0);//green
  ellipse(eyeCenterX+(sf*.01), eyeCenterY, constant1 * (sf*.05), constant1 * (sf*.05)); //Iris
  fill(20);//offblack
  ellipse(eyeCenterX+(sf*.01), eyeCenterY, constant0 * (sf*.04), constant0 * (sf*.04)); // pupil

  //LIDS
  noStroke();
  fill(r, g, b);
  beginShape();//bottomLid fill
  vertex(eyeCenterX-(sf*.1), eyeCenterY);
  bezierVertex(eyeCenterX+(sf*.03), eyeCenterY+(sf*.045), eyeCenterX-(sf*.02), eyeCenterY+(sf*.045), eyeCenterX+(sf*.12), eyeCenterY);

  vertex(eyeCenterX+(sf*.12), eyeCenterY+(sf*.1));
  vertex(eyeCenterX-(sf*.1), eyeCenterY+(sf*.1));
  endShape();

  stroke(80);
  strokeWeight(1*(sf*.004));
  noFill();
  beginShape();//bottomLid stroke
  vertex(eyeCenterX-(sf*.1), eyeCenterY);
  bezierVertex(eyeCenterX+(sf*.03), eyeCenterY+(sf*.045), eyeCenterX, eyeCenterY+(sf*.045), eyeCenterX+(sf*.12), eyeCenterY);
  endShape();

  //--
  noStroke();
  fill(r, g, b);
  beginShape();//upperLid fill
  vertex(eyeCenterX-(sf*.1), eyeCenterY);
  bezierVertex(eyeCenterX-(sf*.05), eyeCenterY-(sf*.01), eyeCenterX-(sf*.05), eyeCenterY-(sf*.03), eyeCenterX-(sf*.02), eyeCenterY-(sf*.04));
  bezierVertex(eyeCenterX+(sf*.06), eyeCenterY-(sf*.06), eyeCenterX+(sf*.1), eyeCenterY-(sf*.02), eyeCenterX+(sf*.12), eyeCenterY);

  vertex(eyeCenterX+(sf*.12), eyeCenterY-(sf*.1));
  vertex(eyeCenterX-(sf*.1), eyeCenterY-(sf*.1));
  endShape();

  stroke(40);  
  strokeWeight(3*(sf*.004));
  noFill();
  beginShape();//upperLid stroke
  vertex(eyeCenterX-(sf*.1), eyeCenterY);
  bezierVertex(eyeCenterX-(sf*.05), eyeCenterY-(sf*.01), eyeCenterX-(sf*.05), eyeCenterY-(sf*.03), eyeCenterX-(sf*.02), eyeCenterY-(sf*.04));
  bezierVertex(eyeCenterX+(sf*.06), eyeCenterY-(sf*.06), eyeCenterX+(sf*.1), eyeCenterY-(sf*.02), eyeCenterX+(sf*.13), eyeCenterY);
  endShape();

  //BROW
  stroke(40);
  strokeWeight(8*(sf*.004));
  noFill();
  beginShape();
  vertex(eyeCenterX-(sf*.1), eyeCenterY-(sf*.08));
  bezierVertex(eyeCenterX+(sf*.005), eyeCenterY-(sf*.12), eyeCenterX-(sf*.005), eyeCenterY-(sf*.12), eyeCenterX+(sf*.15), eyeCenterY-(sf*.08));
  endShape();
}

void drawFace() {

  fill(r, g, b);
  noStroke();

  //stroke(200, 0, 200);

  beginShape(); //chinleft
  vertex(centerx, centery-(sf*.25));
  vertex(centerx-(sf*.5), centery-(sf*.25));
  bezierVertex(centerx-(sf*.45), centery, x+(sf*.1), y+h, centerx, y+h+(sf*.05));
  endShape();

  beginShape(); //chin right
  vertex(centerx, centery-(sf*.25));
  vertex(centerx+(sf*.5), centery-(sf*.25));
  bezierVertex(centerx+(sf*.45), centery, (x+w)-(sf*.1), (y+h), centerx, y+h+(sf*.05));
  endShape();

  //stroke(0, 0, 200);

  ellipseMode(CENTER);

  ellipse(centerx, centery-(.25*sf), sf, sf); //skull

  stroke(40);
  strokeWeight(4*(sf*.004));
  noFill();
  ellipseMode(CENTER);
  arc(centerx, centery+(sf*.05), 15*(sf*.01), 15*(sf*.01), radians(30), PI-radians(30));//nose
  
  arc(centerx, centery+(sf*.3), 15*(sf*.03), 15*(sf*.005), radians(30), PI-radians(30));//nose
}
void drawEars() {
  noStroke();
  fill(r-20, g-20, b-20);

  beginShape();
  vertex(centerx-(sf*.4), centery-(sf*.12));
  bezierVertex(centerx-(sf*.6), centery-(sf*.25), centerx-(sf*.7), centery-(sf*.10), centerx-(sf*.4), centery+(sf*.25));
  endShape();

  beginShape();
  vertex(centerx+(sf*.4), centery-(sf*.12));
  bezierVertex(centerx+(sf*.6), centery-(sf*.25), centerx+(sf*.7), centery-(sf*.10), centerx+(sf*.4), centery+(sf*.25));
  endShape();
}
void drawBody() {
  noStroke();
  fill(r-20, g-20, b-20);

  beginShape(); //left side
  vertex(centerx, centery);
  vertex(centerx-(sf*.3), centery+(sf*.25));
  bezierVertex(centerx-(sf*.25), centery+(sf), centerx-(sf*.45), centery+(sf), centerx-(sf), centery+(sf));
  bezierVertex(centerx-(sf*1.2), centery+(sf), centerx-(sf*.8), centery+(sf*3), centerx-(sf*.8), centery+(sf*3));
  bezierVertex(centerx, centery+(sf*3), centerx, centery+(sf*3), centerx, centery+(sf*3));
  endShape();

  beginShape(); //right side  
  vertex(centerx, centery);
  vertex(centerx+(sf*.3), centery+(sf*.25));
  bezierVertex(centerx+(sf*.25), centery+(sf), centerx+(sf*.45), centery+(sf), centerx+(sf), centery+(sf));
  bezierVertex(centerx+(sf*1.2), centery+(sf), centerx+(sf*.8), centery+(sf*3), centerx+(sf*.8), centery+(sf*3));
  bezierVertex(centerx, centery+(sf*3), centerx, centery+(sf*3), centerx, centery+(sf*3));
  endShape();
}
