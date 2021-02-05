/**
* synthesis of drum sound
*
* @author aa_debdeb
* @date 2016/11/03
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

float sinAmp, sinAtk, sinRls, sinPitch;
float noiAmp, noiAtk, noiRls;

int count = 0;
Knob Interval;

void setupGUI(){
  cp5 = new ControlP5(this);
  float radius = 30;
  cp5.addKnob("sinAmp")
     .setLabel("SINE AMP")
     .setRange(0.0, 1.0)
     .setValue(0.5)
     .setPosition(width / 5.0 - radius, height / 3.0 - radius)
     .setRadius(radius)
     .setDragDirection(Knob.VERTICAL);
  cp5.addKnob("sinAtk")
     .setLabel("SINE ATTACK")
     .setRange(0.01, 0.1)
     .setValue(0.05)
     .setPosition(width * 2.0 / 5.0 - radius, height / 3.0 - radius)
     .setRadius(radius)
     .setDragDirection(Knob.VERTICAL);
  cp5.addKnob("sinRls")
     .setLabel("SINE RELEASE")
     .setRange(0.01, 1.0)
     .setValue(0.1)
     .setPosition(width * 3.0 / 5.0 - radius, height / 3.0 - radius)
     .setRadius(radius)
     .setDragDirection(Knob.VERTICAL);  
  cp5.addKnob("sinPitch")
     .setLabel("SINE PITCH")
     .setRange(110, 440)
     .setValue(220)
     .setPosition(width * 4.0 / 5.0 - radius, height / 3.0 - radius)
     .setRadius(radius)
     .setDragDirection(Knob.VERTICAL);  
  cp5.addKnob("noiAmp")
     .setLabel("NOISE AMP")
     .setRange(0.0, 1.0)
     .setValue(0.5)
     .setPosition(width / 5.0 - radius, height * 2.0 / 3.0 - radius)
     .setRadius(radius)
     .setDragDirection(Knob.VERTICAL);
  cp5.addKnob("noiAtk")
     .setLabel("NOISE ATTACK")
     .setRange(0.01, 0.1)
     .setValue(0.05)
     .setPosition(width * 2.0 / 5.0 - radius, height * 2.0 / 3.0 - radius)
     .setRadius(radius)
     .setDragDirection(Knob.VERTICAL);
  cp5.addKnob("noiRls")
     .setLabel("NOISE RELEASE")
     .setRange(0.01, 0.2)
     .setValue(0.1)
     .setPosition(width * 3.0 / 5.0 - radius, height * 2.0 / 3.0 - radius)
     .setRadius(radius)
     .setDragDirection(Knob.VERTICAL);
Interval =
  cp5.addKnob("Interval")
     .setLabel("INTERVAL")
     .setRange(1, 120)
     .setValue(60)
     .setPosition(width * 3.5 / 5.0 - radius, height * 2.0 / 3.0 - radius)
     .setRadius(radius)
     .setDragDirection(Knob.VERTICAL);     
}

void setup(){
  size(500, 250);
  minim = new Minim(this);
  out = minim.getLineOut();
  setupGUI();
}

void keyPressed(){
  out.playNote(0.0, 0.01, new DrumInstrument());
}

void draw(){
 count++;
 if( count > Interval.getValue()){
   count = 0;
   out.playNote(0.0, 0.01, new DrumInstrument());
 }
}

class DrumInstrument implements Instrument {
  Oscil sine;
  Noise noise;
  ADSR sinAdsr, noiAdsr;
  DrumInstrument(){
    sine = new Oscil(sinPitch, 1.0, Waves.SINE);
    noise = new Noise(1.0);
    sinAdsr = new ADSR(sinAmp, sinAtk, 0.0, sinAmp, sinRls);
    noiAdsr = new ADSR(noiAmp, noiAtk, 0.0, noiAmp, noiRls); 
    sine.patch(sinAdsr);
    noise.patch(noiAdsr);
  }
  
  void noteOn(float dur){
    sinAdsr.noteOn();
    sinAdsr.patch(out);
    noiAdsr.noteOn();
    noiAdsr.patch(out);
  }
  
  void noteOff(){
    sinAdsr.unpatchAfterRelease(out);
    noiAdsr.unpatchAfterRelease(out);
    sinAdsr.noteOff();
    noiAdsr.noteOff();
    
  }
}
