/*
* sample01
*/

import controlP5.*;

ControlP5 cp5;
float knobValue;
Knob knob;
float knobFuncValue;

void setupGui(){
  cp5 = new ControlP5(this);
  
  cp5.addKnob("knobValue") // left knob
     .setLabel("left")
     .setRange(0, 100)
     .setValue(50)
     .setPosition(75, 50)
     .setRadius(50)
     .setDragDirection(Knob.VERTICAL);;
  
  knob = 
  cp5.addKnob("center") // center knob
     .setRange(0, 100)
     .setValue(50)
     .setPosition(250, 50)
     .setRadius(50)
     .setDragDirection(Knob.VERTICAL);
            
  cp5.addKnob("knobFunc") // light knob
     .setLabel("right")
     .setRange(0, 100)
     .setValue(50)
     .setPosition(425, 50)
     .setRadius(50)
     .setNumberOfTickMarks(10)
     .setTickMarkLength(5)
     .setDragDirection(Knob.VERTICAL)
     .snapToTickMarks(true);           
}
 
void setup(){
  size(600, 350);
  rectMode(CENTER);
  setupGui();
}

void knobFunc(float value){
  knobFuncValue = value;
  knob.setValue(value);
}

void center(float value){
  println("called");
}


//void knobValue(float value){
//  println(knobValue);
//}


void draw(){
  background(128);
  stroke(255);
  noFill();
  rect(125, 250, knobValue, knobValue); // left box
  rect(300, 250, knob.getValue(), knob.getValue()); // center box
  rect(475, 250, knobFuncValue, knobFuncValue); //right box
}
