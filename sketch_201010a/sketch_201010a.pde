/*
* sample01
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

// variance for VCO
Oscil oscil;
int octave;
// variance for keyboard
boolean isKeyLocked;
char lockedKey;

void setup(){
  size(800, 500);
  textAlign(CENTER);
  fill(255);
  
  minim = new Minim(this);
  out = minim.getLineOut();
  oscil = new Oscil(440, 1.0, Waves.SQUARE);

  isKeyLocked = false;
  
  cp5 = new ControlP5(this);
  float knobRadius = 25;
  PVector toggleSize = new PVector(40, 20);
  // GUI for VCO
  text("VCO", width / 4.0 * 1.0, height / 4.0 * 0.5);
  cp5.addToggle("setVcoWave")
     .setLabel("VCO WAVE")
     .setValue(true)
     .setPosition(width / 4.0 * 1.0 - toggleSize.x / 2.0, height / 4.0 * 1.0 - toggleSize.y / 2.0)
     .setSize(int(toggleSize.x), int(toggleSize.y))
     .setMode(ControlP5.SWITCH);
  cp5.addKnob("octave")
     .setLabel("OCTAVE")
     .setRange(2, 6)
     .setValue(4)
     .setPosition(width / 4.0 * 1.0 - knobRadius, height / 4.0 * 2.0 - knobRadius)
     .setRadius(knobRadius)
     .setNumberOfTickMarks(4)
     .setTickMarkLength(5)
     .snapToTickMarks(true); 

}

// functions for VCO
void setVcoWave(boolean value){
  if(value){
    oscil.setWaveform(Waves.SQUARE);
  } else {
    oscil.setWaveform(Waves.SAW);  
  }
}

void keyPressed(){
  if(!isKeyLocked){
    String tone = "";
    switch(key){
    case 'z':
      tone += "C"; break;
    case 's':
      tone += "C#"; break;
    case 'x':
      tone += "D"; break;
    case 'd':
      tone += "D#"; break;
    case 'c':
      tone += "E"; break;
    case 'v':
      tone += "F"; break;
    case 'g':
      tone += "F#"; break;
    case 'b':
      tone += "G"; break;
    case 'h':
      tone += "G#"; break;
    case 'n':
      tone += "A"; break;
    case 'j':
      tone += "A#"; break;
    case 'm':
      tone += "B"; break;
    }
    if(tone != ""){
      oscil.setFrequency(Frequency.ofPitch(tone + octave).asHz());
      oscil.patch(out);
      isKeyLocked = true;
      lockedKey = key;
    }
  }
}

void keyReleased(){
  if(isKeyLocked && key == lockedKey){
    oscil.unpatch(out);
    isKeyLocked = false;
  }
}

void draw(){
  background( 0 );
  stroke( 255 );
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    line( x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line( x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }  
}
