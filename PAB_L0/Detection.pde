//detection Objects
OpenCV detectFace;
OpenCV detectEyes;

//detection Data
Rectangle[] faces;
Rectangle[] eyes;



void runDetection() {
  println("Running Detection ...");

  detectFace();
  detectEyes();
  drawingDriver();
}

void detectFace() {

  detectFace = new OpenCV(this, img);
  detectFace.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  faces = detectFace.detect();

  noFill();
  noStroke();
  //stroke(0, 200, 0); 
  strokeWeight(3);//drawing style

  rect(faces[0].x, faces[0].y, faces[0].width, faces[0].height);
  int sf = (faces[0].width+faces[0].height)/2;
  
  
}
void detectEyes() {
  int eyeCount = 0;
  detectEyes = new OpenCV(this, img);
  detectEyes.loadCascade(OpenCV.CASCADE_EYE);
  eyes = detectEyes.detect();

  noFill();
  noStroke();
  //stroke(200, 0, 0);
  strokeWeight(3);

  for (int i = 0; i < eyes.length; i++) {
    if (eyes[i].y > faces[0].y && eyes[i].y < faces[0].y + (faces[0].height/3) && eyeCount < 2) { //proceed if the detected eye is in the upper third of the face
      rect(eyes[i].x, eyes[i].y, eyes[i].width, eyes[i].height);
      eyeCount++;
    } else { 
      eyes[i] = null;
    }
  }
}
