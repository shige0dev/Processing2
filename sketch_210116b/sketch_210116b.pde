/*
* sample03
*/

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import controlP5.*;

Minim minim;
AudioOutput out;
ControlP5 cp5;
Knob cutoffFrequencyKnob;


// variance for keyboard
boolean isKeyLocked;
char lockedKey;
float knobRadius = 25;
PVector toggleSize = new PVector(40, 20);
float   setCutoffFrequency;

void setupGUI(){
  cp5 = new ControlP5(this);
  
  cutoffFrequencyKnob = cp5.addKnob("setCutoffFrequency")
                           .setLabel("CUTOFF FREQUENCY")
                            .setRange(0, 10000)
                           .setValue(10000)
                           .setPosition(width / 4.0 * 2.0 - knobRadius, height / 4.0 * 1.0 - knobRadius)
                           .setRadius(knobRadius);
}

void setup(){
  size(800, 500);
  textAlign(CENTER);
  fill(255);
  setupGUI();
}


// functions for VCF
void setCutoffFrequency(float _value){
  println( setCutoffFrequency );
}

void draw(){
  //println(cutoffFrequencyKnob.getValue());
    println( setCutoffFrequency );
}

  
