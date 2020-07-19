import controlP5.*;

ArrayList<Check> checks = new ArrayList<Check>();

ControlP5 gui; 
int slideSize = 200;
Check c;
Check c2;

int checkX = 180;
int checkY = -10;
color checkCol;

void setup(){
  size(600,600);
  background(255);
  pushMatrix();
  translate(width/2-100,100);  
  
  
  //UI-Elements
  
  gui = new ControlP5(this);
  
  gui.addSlider("sliderX")
  .setPosition(width/2-slideSize/2, height/2-40)
  .setSize(slideSize,10);
  //moves value label under the slidebar so you can't see it (because its also white like the bg)
  gui.getController("sliderX").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  

  gui.addSlider("sliderY")
    .setPosition(width/2-slideSize/2, height/2+40)
    .setSize(slideSize,10);
  gui.getController("sliderY").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  
  gui.addSlider("sliderCol")
    .setPosition(width/2-slideSize/2, height/2+120)
    .setSize(slideSize,10)
    .setRange(0,255);
  gui.getController("sliderCol").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
  
  gui.addButton("admit")
    .setPosition(width/2-slideSize/2+50,height/2+200)
    .setSize(100,30);
    
  popMatrix();
  
 
}


void draw(){
  background(255);
  
  pushMatrix();
  translate(width/2-100,100); 
  
  drawM();

  //draw every 'Check' from ArrayList
  for (int i = 0; i <= checks.size()-1; i++){   
     checks.get(i).update();
   }
   
  //pass variables to the object
  c = new Check(checkX,checkY,checkCol);
  c.update();
 
 
  popMatrix();
   
}


 // x-Wert min 100 - 200 max 
 // y-Wert min -10-90 max
 // Skala f. Slider von 0-100 anpassen
 
void sliderX(int x){
   println(x);
   checkX = x+100;
}

void sliderY(int y){
   println(y);
   checkY = y-10;
}

void sliderCol(int col){
  checkCol = color(205,75,col,50);
}

void admit(){
  //when you click the Admit-Button the current check-object is added to the ArrayList
  checks.add(c);
  //set all values to 0 again
  gui.getController("sliderX").setValue(0);
  gui.getController("sliderY").setValue(0);
  gui.getController("sliderCol").setValue(0);
}

void drawM(){
  // "M"- part of the logo
  noStroke();
  fill(0);
  triangle(40, 20, 90, 13, 90, 70);
  fill(50);
  triangle(30, 65, 30, 20, 90, 13);
 
}
