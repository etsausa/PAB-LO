//import java.util.Arrays;

String analyizeFaceColor() {
  
  color[] data = getData();
  ArrayList<String[]> countedData = countData(data);
  String max = maxValue(countedData);
  
  return max;
}


void printData( ArrayList<String[]> colorData) {
  
  int sf = (faces[0].width+faces[0].height)/2;
  int x = int(faces[0].x + (sf*.2));
  int y = int(faces[0].y + (sf*.1));
  int w = int(faces[0].width - (sf*.4));
  int h = int(faces[0].height - (sf*.2));
  int index = 0;


  for (int i = 0; i < colorData.size(); i++) {
    int count = int(colorData.get(index)[1]);
    String cSTR = colorData.get(index)[0];
    int c = unhex(cSTR);

    for (int k = 0; k < count; k++) {
      if (x > w) {
        x = x-w;
        y++;
      }
      set(x+500, y, c);
      x++; //advance across row
    }

    index++; //add to pixel count
  }
}

String maxValue(ArrayList<String[]> data){
  int maxINT = 0;
  String maxHEX = "FF000000";
  for(int i = 0; i < data.size(); i++){
    int tempINT = int(data.get(i)[1]);
    
    if (tempINT > maxINT){
      maxINT = tempINT;
      maxHEX = data.get(i)[0];
    }
  }
  
  println("Most Common color: " + maxHEX + " appears " + maxINT + " times");
  
  return maxHEX;
}

ArrayList<String[]> countData(color[] data) {
  println("Processing Color Data ...");
  String[] temp = {"FFC5C6C1", "0"};
  ArrayList<String[]> colorData = new ArrayList<String[]>();
  colorData.add(temp);

  int end = colorData.size();

  for (int i = 0; i < data.length; i++) {//for each pixel
    boolean hasEntry = false;

    for (int j = 0; j < colorData.size(); j++) { //check for data entries

      if (hex(data[i]).equals(colorData.get(j)[0])) {//if current pixel equals current entry

        //println("EQUAL");

        //increment counter
        String countSTR = colorData.get(j)[1];
        int countINT = int(countSTR);
        countINT++;
        countSTR = Integer.toString(countINT);
        colorData.get(j)[1] = countSTR;

        //println(hex(data[i]) + " appears " + colorData.get(j)[1] + " times.");

        hasEntry = true;

        break; //since we found the value, we can break out of this loop
      } else {
      }
    }//\check for data entries

    if (!hasEntry) {

      colorData.add(new String [] {hex(data[i]), "1"});

      //println(hex(data[i]) + " added");
    }//\Entry check
  }//\for each pixel
  println("...Processing Complete!");
  return colorData;
}


color[] getData() {
  //grab bounding box data
  int sf = (faces[0].width+faces[0].height)/2;
  int x = int(faces[0].x + (sf*.2));
  int y = int(faces[0].y + (sf*.1));
  int w = int(faces[0].width - (sf*.4));
  int h = int(faces[0].height - (sf*.2));

  color tempColor;
  color[] facePixels = new color[w*h];//can store every pixel of the face (intial grab)

  int index = 0; //used to keep track of pixel number

  for (int j = 0; j < h; j++) {//for y (advance row  [DOWN])

    for (int i = 0; i < w; i++) {//for x (span row [LEFT])


      tempColor = get(x, y); //get current pixel's color

      set(x+500, y, tempColor); //display on panel 02

      facePixels[index] = tempColor;

      x++; //advance across row
      index++; //add to pixel count
    }
    x = x - w; //at the end of the row, go back to the start
    y++; //advance down
  }
  return facePixels;
}
