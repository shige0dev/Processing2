import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import controlP5.*;

Minim minim;
AudioOutput out;
Sampler sound1;
MoogFilter  moog;
Oscil sineOsc;
ADSR  adsr;
Midi2Hz m2h;


int bpm;
int filter;
float gateTime;
float n_millis;
int count =0;
int beat = 0;

ControlP5 cp5;

Params params;

Knob moogFilter;

void setup() {
  size(800, 500);
  frameRate(600);
  setupGUI();

  minim = new Minim(this);
  out = minim.getLineOut();
  moog    = new MoogFilter( 1200, 0.5 );
  
  //sound1 = new Sampler("Sound1.wav", 8, minim);
  //sound1.patch(out);
 
  
  params = new Params();
  
  out.setTempo(bpm);
  out.playNote(0.0, 1.0, new RhythmMachine() );
}


void draw() {  
  //background(0);
  //stroke(255);
  //for(int i = 0; i < out.bufferSize() - 1; i++){
  //  line(i, 400 + out.left.get(i) * 100, i + 1,  400 + out.left.get(i + 1) * 100);
  ////  line(i, 150 + out.right.get(i) * 50, i + 1,  150 + out.right.get(i + 1) * 50);
  //}
}

class RhythmMachine implements Instrument {

  void noteOn(float duration) {
     params.update();
    if (beat%4 == 0) {
       //sound1.trigger();    
       out.playNote( 0, 6, new ToneInstrument( params ) );  
      //out.playNote(0.0, 0.05, "A5");
      //params.update();
      //out.playNote( 0, 0.95, new ToneInstrument( params ) );  
   }
}

  void noteOff() {
     beat++;
     if (beat == 16) beat = 0;
     out.setTempo(bpm);
     out.playNote(0.0, 2.0, this);
  }
}
