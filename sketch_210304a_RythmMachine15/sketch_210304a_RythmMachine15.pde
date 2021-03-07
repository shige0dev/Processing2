import ddf.minim.spi.*;
import ddf.minim.signals.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import controlP5.*;

Minim minim;
AudioOutput out;
Oscil sineOsc;
ADSR  adsr;
Midi2Hz midi2hz;
Summer sum;

int bpm;
int filter;
float gateTime;
float n_millis;
int count =0;
int beat = 0;

ControlP5 cp5;



Params[][] params = new Params[6][2];

void setup() {
  size(800, 500);
  frameRate(600);

   
  for(int i=0;i<6;++i){
    params[i][0] = new Params();
    params[i][1] = new Params();
  }
  setupGUI();
  setGUIValue();

  minim = new Minim(this);
  out = minim.getLineOut();  
  out.setTempo(bpm);
  out.playNote(0.0, 0.25, new RhythmMachine() );
}


void bang0() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[0][i].setState(false);
    } else {
      toggles[0][i].setState(true);
    }
  }
}

void bang1() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[1][i].setState(false);
    } else {
      toggles[1][i].setState(true);
    }
  }
}

void bang2() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[2][i].setState(false);
    } else {
      toggles[2][i].setState(true);
    }
  }
}

void bang3() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[3][i].setState(false);
    } else {
      toggles[3][i].setState(true);
    }
  }
}

void bang4() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[4][i].setState(false);
    } else {
      toggles[4][i].setState(true);
    }
  }
}

void bang5() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[5][i].setState(false);
    } else {
      toggles[5][i].setState(true);
    }
  }
}

void bang6() {
  for (int i = 0; i < 16; i++) {
    if (random(100)>30) {
      toggles[6][i].setState(false);
    } else {
      toggles[6][i].setState(true);
    }
  }
}

void current1() {
  Number = 0;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][1] ) );
}
void current2() {
  Number = 1;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][1] ) );
}
void current3() {
  Number = 2;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][1] ) );
}
void current4() {
  Number = 3;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][1] ) );
}
void current5() {
  Number = 4;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();  
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][1] ) );

}
void current6() {
  Number = 5;
  Parts.setValue(Number);
  setGUIValue();
  getGUIValue();
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][0] ) );
  out.playNote( 0, 1.0, new ToneInstrument( params[Number][1] ) );
}

void parts(int value){
  Number = value;
  setGUIValue();
}

void draw()
{
  // erase the window to black
  background( 0 );
  // draw using a white stroke
  stroke( 255 );
  // draw the waveforms
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    // find the x position of each buffer value
    float x1  =  map( i, 0, out.bufferSize(), 170, width-120 );
    float x2  =  map( i+1, 0, out.bufferSize(), 170, width-120 );
    // draw a line from one buffer position to the next for both channels
    line( x1, 50 + out.left.get(i)*20, x2, 50 + out.left.get(i+1)*20);
    line( x1, 80 + out.right.get(i)*20, x2, 80 + out.right.get(i+1)*20);
  }  
}

class RhythmMachine implements Instrument {

  void noteOn(float duration) {
    getGUIValue();
    
    if (toggles[1][beat].getBooleanValue()) {
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[0][0] ) );
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[0][1] ) );
  }
    if (toggles[2][beat].getBooleanValue()) {
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[1][0] ) );
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[1][1] ) );
    }
    if (toggles[3][beat].getBooleanValue()) {
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[2][0] ) );
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[2][1] ) );
    }
    if (toggles[4][beat].getBooleanValue()) {
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[3][0] ) );
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[3][1] ) );
    }    
    if (toggles[5][beat].getBooleanValue()) {
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[4][0] ) );
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[4][1] ) );
    }
    if (toggles[6][beat].getBooleanValue()) {
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[5][0] ) );
      out.playNote( 0, float(bpm)/120 , new ToneInstrument( params[5][1] ) );
    }  
    //metronome
    if (beat%4 == 0) {
      //out.playNote(0.0, 0.05, "A5");
    }
  }


  void noteOff() {
    toggles[0][beat].setState(false);
    beat++;
    if (beat == 16) beat = 0;
    toggles[0][beat].setState(true);
    out.setTempo(bpm);
    out.playNote(0.0, 0.25, this);
  }
}
