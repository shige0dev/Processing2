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
  moogFilter = cp5.addKnob("filter")
    .setRange(50, 12000)
    .setValue(8000)
    .setPosition( width/10 * 3- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);     
  for (int i = 0; i < 16; i++) {
    toggles0[i] = cp5.addToggle("sound0" + (i + 1))
      .setCaptionLabel("")
      .setValue(false)
      .setPosition(width / (16 + 1) * (i + 1) - toggleSize.x / 2, height / 8 * 3 - toggleSize.y / 2)
      .setSize(int(toggleSize.x), int(toggleSize.y));
    toggles1[i] = cp5.addToggle("sound1" + (i + 1))
      .setValue(false)
      .setPosition(width / (16 + 1) * (i + 1) - toggleSize.x / 2, height / 8 * 4 - toggleSize.y / 2)
      .setSize(int(toggleSize.x), int(toggleSize.y));       
    toggles2[i] = cp5.addToggle("sound2" + (i + 1))
      .setValue(false)
      .setPosition(width / (16 + 1) * (i + 1) - toggleSize.x / 2, height / 8 * 5 - toggleSize.y / 2)
      .setSize(int(toggleSize.x), int(toggleSize.y));       
    toggles3[i] = cp5.addToggle("sound3" + (i + 1))
      .setValue(false)
      .setPosition(width / (16 + 1) * (i + 1) - toggleSize.x / 2, height / 8 * 6 - toggleSize.y / 2)
      .setSize(int(toggleSize.x), int(toggleSize.y));       
    toggles4[i] = cp5.addToggle("sound4" + (i + 1))
      .setValue(false)
      .setPosition(width / (16 + 1) * (i + 1) - toggleSize.x / 2, height / 8 * 7 - toggleSize.y / 2)
      .setSize(int(toggleSize.x), int(toggleSize.y));
  }
}

void setup() {
  size(800, 500);
  frameRate(600);
  setupGUI();

  minim = new Minim(this);
  out = minim.getLineOut();
  moog    = new MoogFilter( 1200, 0.5 );

  sound1 = new Sampler("Sound1.wav", 8, minim);
  sound1.patch(moog).patch(out);
  sound2 = new Sampler("Sound2.wav", 8, minim);
  sound2.patch(out);
  sound3 = new Sampler("Sound3.wav", 8, minim);
  sound3.patch(out);
  
  TimerTask task = new TimerTask() {
    public void run() {
     toggles0[beat].setState(false);
     beat++;
     if (beat == 16) beat = 0;
     toggles0[beat].setState(true); 
     out.setTempo(bpm);
     out.pauseNotes();    
     out.playNote(0.0, gateTime, new RhythmMachine() );
     out.resumeNotes();
    }
  };
  
  timer = new Timer();
  timer.scheduleAtFixedRate( task, 0, 15000/bpm );
 // timer.setInitialDelay();
  n_millis = millis();
}

void filter(){
   moog.frequency.setLastValue(moogFilter.getValue());
}

void draw() {  
 // timer.getDelay();
  //if( millis() > n_millis){
  //  toggles0[beat].setState(false);
  //  beat++;
  //  if (beat == 16) beat = 0;
  //  toggles0[beat].setState(true); 
    
  //  out.setTempo(bpm);
  //  out.pauseNotes();    
  //  out.playNote(0.0, gateTime, new RhythmMachine() );
  //  //out.playNote(0.0, gateTime, "A5" );
  //  out.resumeNotes();
  //  n_millis = n_millis + 15000/bpm;  //125ms = 120bpm  250ms = 60bpm
  //}
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
  }

  void noteOff() {
    //beat++;
    //if(beat == 16) beat = 0;
    //println(beat);
    //  out.setTempo(bpm);
    //  out.playNote(0.0, 0.1, "A5");
    //  out.playNote(0.0, gateTime, this);
  }
}
