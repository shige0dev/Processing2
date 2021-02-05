import java.util.TimerTask;
import java.util.Timer;

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import controlP5.*;

Timer timer;

Minim minim;
AudioOutput out;
Sampler sound1, sound2, sound3;
MoogFilter  moog;

int bpm;
int filter;
float gateTime;
float n_millis;
int count =0;
int beat = 0;

ControlP5 cp5;

Toggle[] toggles0;
Toggle[] toggles1;
Toggle[] toggles2;
Toggle[] toggles3;
Toggle[] toggles4;

Knob moogFilter;

void setupGUI() {
  cp5 = new ControlP5(this);
  float knobRadius = 25;
  PVector toggleSize = new PVector(30, 30); 
  PVector bangSize = new PVector(20, 20); 
  toggles0 = new Toggle[16];
  toggles1 = new Toggle[16];
  toggles2 = new Toggle[16];
  toggles3 = new Toggle[16];
  toggles4 = new Toggle[16];

  cp5.addKnob("bpm")
    .setRange(60, 240)
    .setValue(120)
    .setPosition( width/10 * 1- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  cp5.addKnob("gateTime")
    .setRange(0.1, 0.5)
    .setValue(0.2)
    .setPosition( width/10 * 2- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  moogFilter = 
  cp5.addKnob("filter")
    .setRange(50, 12000)
    .setValue(8000)
    .setPosition( width/10 * 3- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);     
  
  for (int i = 0; i < 16; i++) {
    toggles0[i] = cp5.addToggle("sound0" + (i + 1))
      .setCaptionLabel("")
      .setValue(false)
      .setPosition(width / (22 + 1) * (i + 6) - toggleSize.x / 2, height / 12 * 5 - toggleSize.y / 2)
      .setLabel("")
      .setSize(int(toggleSize.x), int(toggleSize.y));
    toggles1[i] = cp5.addToggle("sound1" + (i + 1))
      .setValue(false)
      .setPosition(width / (22 + 1) * (i + 6) - toggleSize.x / 2, height / 12 * 6 - toggleSize.y / 2)
      .setLabel("")
      .setSize(int(toggleSize.x), int(toggleSize.y));       
    toggles2[i] = cp5.addToggle("sound2" + (i + 1))
      .setValue(false)
      .setPosition(width / (22 + 1) * (i + 6) - toggleSize.x / 2, height / 12 * 7 - toggleSize.y / 2)
      .setLabel("")
      .setSize(int(toggleSize.x), int(toggleSize.y));       
    toggles3[i] = cp5.addToggle("sound3" + (i + 1))
      .setValue(false)
      .setPosition(width / (22 + 1) * (i + 6) - toggleSize.x / 2, height / 12 * 8 - toggleSize.y / 2)
      .setLabel("")
      .setSize(int(toggleSize.x), int(toggleSize.y));       
    toggles4[i] = cp5.addToggle("sound4" + (i + 1))
      .setValue(false)
      .setPosition(width / (22 + 1) * (i + 6) - toggleSize.x / 2, height / 12 * 9 - toggleSize.y / 2)
      .setLabel("")
      .setSize(int(toggleSize.x), int(toggleSize.y));
  }
  cp5.addBang("bang1")
     .setPosition(width / (22 + 1) * 5 - toggleSize.x / 2, height / 12 * 6 - toggleSize.y / 2)
     .setSize( int(bangSize.x), int(bangSize.y))
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("bang");
  cp5.addBang("bang2")
      .setPosition(width / (22 + 1) * 5 - toggleSize.x / 2, height / 12 * 7 - toggleSize.y / 2)
     .setSize( int(bangSize.x), int(bangSize.y))
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("bang");
  cp5.addBang("bang3")
      .setPosition(width / (22 + 1) * 5 - toggleSize.x / 2, height / 12 * 8 - toggleSize.y / 2)
     .setSize( int(bangSize.x), int(bangSize.y))
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("bang");
}

void setup() {
  size(800, 500);
  frameRate(600);
  setupGUI();

  minim = new Minim(this);
  out = minim.getLineOut();
  moog    = new MoogFilter( 1200, 0.5 );

  sound1 = new Sampler("Sound1.wav", 8, minim);
  sound1.patch(out);
  sound2 = new Sampler("Sound2.wav", 8, minim);
  sound2.patch(moog).patch(out);
  sound3 = new Sampler("Sound3.wav", 8, minim);
  sound3.patch(out);
  
  out.setTempo(bpm);
  out.playNote(0.0, 0.25, new RhythmMachine() );
}

void filter(){
   moog.frequency.setLastValue(moogFilter.getValue());
}

void bang1(){
  for (int i = 0; i < 16; i++) {
    if(random(100)>30){
     toggles1[i].setState(false);
    }else{
     toggles1[i].setState(true);
    }
  }
}
void bang2(){
  for (int i = 0; i < 16; i++) {
    if(random(100)>30){
     toggles2[i].setState(false);
    }else{
     toggles2[i].setState(true);
    }
  }
}
void bang3(){
  for (int i = 0; i < 16; i++) {
    if(random(100)>30){
     toggles3[i].setState(false);
    }else{
     toggles3[i].setState(true);
    }
  }
}

void draw() {  
}

class RhythmMachine implements Instrument {

  void noteOn(float duration) {
    if (toggles1[beat].getBooleanValue()) {
      sound1.trigger();
    }
    if (toggles2[beat].getBooleanValue()) {
      sound2.trigger();
    }
    if (toggles3[beat].getBooleanValue()) {
      sound3.trigger();
    }
    //out.playNote(0.0, gateTime, "A5");
  }

  void noteOff() {
     toggles0[beat].setState(false);
     beat++;
     if (beat == 16) beat = 0;
     toggles0[beat].setState(true); 
    out.setTempo(bpm);
    out.playNote(0.0, 0.25, this);
  }
}
