import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import controlP5.*;

Minim minim;
AudioOutput out;
Sampler sound1, sound2, sound3, sound4;
MoogFilter  moog;
Oscil sineOsc;
ADSR  adsr;
Midi2Hz midi2hz;

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

Params params;

Knob moogFilter;

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
  sound4 = new Sampler("Sound4.wav", 8, minim);
  sound4.patch(out);
 
  
  params = new Params();
  //params[2] = new Params();
  //params[3] = new Params();
  //params[4] = new Params();
  
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
void bang4(){
  for (int i = 0; i < 16; i++) {
    if(random(100)>30){
     toggles4[i].setState(false);
    }else{
     toggles4[i].setState(true);
    }
  }
}
void draw() {  
}

class RhythmMachine implements Instrument {

  void noteOn(float duration) {
    if (toggles1[beat].getBooleanValue()) {
      out.playNote( 0, 0.1, new SampleInstrument(sound1 ) );  
      //out.playNote( 0.125, 0.1, new SampleInstrument(sound1 ) );  
      //out.playNote( 0.25, 0.1, new SampleInstrument(sound1 ) );  
      //out.playNote( 0.375, 0.1, new SampleInstrument(sound1 ) );  
}
    if (toggles2[beat].getBooleanValue()) {
      out.playNote( 0, 0.1, new SampleInstrument(sound2 ) );  
      //out.playNote( 0.125, 0.1, new SampleInstrument(sound2 ) );  
      //out.playNote( 0.25, 0.1, new SampleInstrument(sound2 ) );  
      //out.playNote( 0.375, 0.1, new SampleInstrument(sound2 ) );  
    }
    if (toggles3[beat].getBooleanValue()) {
      out.playNote( 0, 0.05, new SampleInstrument(sound3 ) );  
      //out.playNote( 0.125, 0.05, new SampleInstrument(sound3 ) );  
      //out.playNote( 0.25, 0.05, new SampleInstrument(sound3 ) );  
      //out.playNote( 0.375, 0.05, new SampleInstrument(sound3 ) ); 
    }
    if (toggles4[beat].getBooleanValue()) {
   //   sound4.trigger();
      params.update();
     out.playNote( 0, 0.5, new ToneInstrument( params ) );  
    }
    if (beat%4 == 0) {
      //out.playNote(0.0, 0.05, "A5");
      //params.update();
      //out.playNote( 0, 0.95, new ToneInstrument( params ) );  
   }
    
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