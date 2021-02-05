/*
* sample04
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
Sampler kick, snare, hihat;
int bpm;
int beat = 0;

ControlP5 cp5;
Toggle[] kickToggles;
Toggle[] snareToggles;
Toggle[] hihatToggles;

void setup(){
  size(800, 500);
  cp5 = new ControlP5(this);
  kickToggles = new Toggle[16];
  snareToggles = new Toggle[16];
  hihatToggles = new Toggle[16];
  float knobRadius = 25;
  PVector toggleSize = new PVector(30, 20);
  cp5.addKnob("bpm")
     .setRange(60, 240)
     .setValue(120)
     .setPosition(width / 2 - knobRadius, height / 5 * 1 - knobRadius)
     .setRadius(knobRadius);
  for(int i = 0; i < 16; i++){
    kickToggles[i] = cp5.addToggle("kick" + (i + 1))
                        .setValue(false)
                        .setPosition(width / (16 + 1) * (i + 1) - toggleSize.x / 2, height / 5 * 2 - toggleSize.y / 2)
                        .setSize(int(toggleSize.x), int(toggleSize.y));       
    snareToggles[i] = cp5.addToggle("snare" + (i + 1))
                        .setValue(false)
                        .setPosition(width / (16 + 1) * (i + 1) - toggleSize.x / 2, height / 5 * 3 - toggleSize.y / 2)
                        .setSize(int(toggleSize.x), int(toggleSize.y));       
    hihatToggles[i] = cp5.addToggle("hihat" + (i + 1))
                        .setValue(false)
                        .setPosition(width / (16 + 1) * (i + 1) - toggleSize.x / 2, height / 5 * 4 - toggleSize.y / 2)
                        .setSize(int(toggleSize.x), int(toggleSize.y));       
  }
  minim = new Minim(this);
  out = minim.getLineOut();
  kick = new Sampler("kick.wav", 8, minim);
  kick.patch(out);
  snare = new Sampler("snare.wav", 8, minim);
  snare.patch(out);
  hihat = new Sampler("hihat.wav", 8, minim);
  hihat.patch(out);
  out.setTempo(bpm);
  out.playNote(0, 0.25, new RhythmMachine());
}

void draw(){

}

class RhythmMachine implements Instrument {
  
  void noteOn(float duration){
    if(kickToggles[beat].getBooleanValue()){
      kick.trigger();
    }
    if(snareToggles[beat].getBooleanValue()){
      snare.trigger();
    }
    if(hihatToggles[beat].getBooleanValue()){
      hihat.trigger();
    }
  }
  
  void noteOff(){
    beat++;
    if(beat == 16) beat = 0;
    out.setTempo(bpm);
    out.playNote(0.0, 0.25, this);
  }
}
