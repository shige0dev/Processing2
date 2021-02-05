/**
 * ControlP5 Bang
 * A bang triggers an event that can be received by a function named after the bang.
 * By default a bang is triggered when pressed, this can be changed to 'release' 
 * using theBang.setTriggerEvent(Bang.RELEASE).
 *
 * find a list of public methods available for the Bang Controller 
 * at the bottom of this sketch.
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 * 
 */

import controlP5.*;

ControlP5 cp5;

int myColorBackground = color(0, 0, 0);

color[] col = new color[] {
  color(100), color(150), color(200), color(250)
};


void setup() {
  size(400, 600);
  noStroke();
  cp5 = new ControlP5(this);
  for (int i=0;i<col.length;i++) {
    cp5.addBang("bang"+i)
       .setPosition(40+i*80, 200)
       .setSize(40, 40)
       .setId(i)
       ;
  }
  
  // change the trigger event, by default it is PRESSED.
  cp5.addBang("bang")
     .setPosition(40, 300)
     .setSize(280, 40)
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("changeBackground")
     ;
           
}

void draw() {
  background(myColorBackground);
  for (int i=0;i<col.length;i++) {
    fill(col[i]);
    rect(40+i*80, 50, 40, 80);
  }
}


public void bang() {
  int theColor = (int)random(255);
  myColorBackground = color(theColor);
  println("### bang(). a bang event. setting background to "+theColor);
}

public void controlEvent(ControlEvent theEvent) {
  for (int i=0;i<col.length;i++) {
    if (theEvent.getController().getName().equals("bang"+i)) {
      col[i] = color(random(255));
    }
  }
  
}
