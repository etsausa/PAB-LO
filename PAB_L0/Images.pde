import processing.video.*;

ControlP5 cp5;
Capture video;
PImage img;

boolean takePicture = false;

/*GUI----------------------------------------------------------------------*/
void getImage() {
  //this method controls if we are going to use a preloaded file or snap a photo 

  cp5 = new ControlP5(this);

  cp5.addButton("Take_a_Picture")
    .setPosition(125, 250)
    .setSize(100, 50)
    ;

  cp5.addButton("Load_an_Image")
    .setPosition(275, 250)
    .setSize(100, 50)
    ;
}
/*TAKE PICTURE -------------------------------------------------------------*/
public void Take_a_Picture() {
  println("Taking a Picture...");

  grabPhoto();

  cp5.getController("Take_a_Picture").remove();
  cp5.getController("Load_an_Image").remove();
}

void grabPhoto() {

  background(255);
  takePicture = true;
  
  fill(50,50,200);
  noStroke();
  rect(0,475,500,25);

  cp5.addButton("retake")
    .setPosition(175, 475)
    .setSize(50, 25)
    ; 
  cp5.addButton("save")
    .setPosition(225, 475)
    .setSize(50, 25)
    ;
  cp5.addButton("next")
    .setPosition(275, 475)
    .setSize(50, 25)
    ;

  video.start();
}

void captureEvent (Capture video) {
  video.read();
}

public void retake() {
  video.start();
  takePicture = true;
  
  fill(50,50,200);
  noStroke();
  rect(0,475,500,25);
}
public void save() {
  video.stop();
  img = video;
  takePicture = false;
}
public void next() {
  fill(255, 10, 50);
  textSize(12);
  text("Processing Color Data...", 70, 495);
  
  runDetection();
}

/*LOAD IMAGE -------------------------------------------------------------*/
public void Load_an_Image() {
  println("Loading an image...");

  grabFile();

  cp5.getController("Take_a_Picture").remove();
  cp5.getController("Load_an_Image").remove();
}

void grabFile() {
  background(255);
  
  cp5.addButton("remove_Thumbs")
      .setBroadcast(false)
      .setPosition(0,0)
      .setSize(500, 25)
      .setBroadcast(true)
      ;

  for (int i = 0; i < thumbs.length; i++) {
    thumbs[i].resize(100, 100);
    

    cp5.addButton("image"+i)
      .setBroadcast(false)
      .setImage(thumbs[i])
      .setPosition(50+(i*100), 400)
      .setSize(100, 100)
      .setValue(i)
      .setBroadcast(true)
      ;
  }
}

public void remove_Thumbs() {
  
  println("removing thumbnails");
  
  cp5.getController("image0").remove();
  cp5.getController("image1").remove();
  cp5.getController("image2").remove();
  cp5.getController("image3").remove();
  cp5.getController("removeThumbs").remove();
  
}

public void image0() {
  println("image0 loaded");

  float i = cp5.getController("image0").getValue();
  img = images[int(i)];
  image(img, 0, 0);
  
  runDetection();
} 

public void image1() {
  println("image1 loaded");

  float i = cp5.getController("image1").getValue();
  img = images[int(i)];
  image(img, 0, 0);
  
  runDetection();
}


public void image2() {
  println("image2 loaded");

  float i = cp5.getController("image2").getValue();
  img = images[int(i)];
  image(img, 0, 0);

  runDetection();
}
public void image3() {
  println("image3 loaded");

  float i = cp5.getController("image3").getValue();
  img = images[int(i)];
  image(img, 0, 0);
  
  runDetection();
}
