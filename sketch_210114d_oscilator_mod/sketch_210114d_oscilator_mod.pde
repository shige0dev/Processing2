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

// variance for VCO
Oscil oscil1;
Noise noise1;
int octave;
// variance for VCF
MoogFilter filter;
Knob cutoffFrequencyKnob;
// variance for VCA
ADSR adsr1,adsr2;
Multiplier multiplier;
Knob amplitudeKnob, attackKnob, sustainKnob, decayReleaseKnob;
// variance for LFO
Oscil vcoLfo, vcfLfo, vcaLfo;
float vcoLfoIntensity;
Knob vcfLfoIntensityKnob, vcaLfoIntensityKnob;
// variance for keyboard
boolean isKeyLocked;
char lockedKey;
float knobRadius = 25;
PVector toggleSize = new PVector(40, 20);


void setup(){
  size(800, 500);
  textAlign(CENTER);
  fill(255);
  
  minim = new Minim(this);
  out = minim.getLineOut();
  oscil1 = new Oscil(440, 1.0, Waves.SQUARE);
  noise1 = new Noise(1.0, Noise.Tint.WHITE);
  filter = new MoogFilter(10000, 0.0, MoogFilter.Type.LP);
  multiplier = new Multiplier(1.0);
  adsr1 = new ADSR(1.0, 1.0, 1.0, 0.5, 1.0);
  adsr2 = new ADSR(1.0, 1.0, 1.0, 0.5, 1.0);
  oscil1.patch(filter).patch(multiplier).patch(adsr1);
//  noise1.patch(filter).patch(multiplier).patch(adsr2);
  vcoLfo = new Oscil(10, 0.0, Waves.SINE);
  vcoLfo.patch(oscil1.frequency);
  vcfLfo = new Oscil(10, 0.0, Waves.SINE);
  vcfLfo.amplitude.setLastValue(0.0);
  vcfLfo.offset.setLastValue(10000);
  vcfLfo.patch(filter.frequency);
  vcaLfo = new Oscil(10, 0.0, Waves.SINE);
  vcaLfo.amplitude.setLastValue(0.0);
  vcaLfo.offset.setLastValue(1.0);
  vcaLfo.patch(multiplier.amplitude);
  
  isKeyLocked = false;
  
  setupGUI();
}


// functions for VCO
void setVcoWave(int value){
  if(value == 0){
    oscil1.setWaveform(Waves.SINE);
  } 
  if(value == 1){
    oscil1.setWaveform(Waves.TRIANGLE);   
  }
  if(value ==2){
    oscil1.setWaveform(Waves.SQUARE);
  }  
  if(value ==3){
    oscil1.setWaveform(Waves.SAW);  
  }   
  if(value ==4){
  }   
}

// functions for VCF
void setCutoffFrequency(float value){
  vcfLfo.amplitude.setLastValue(value / 2.0 * vcfLfoIntensityKnob.getValue());
  vcfLfo.offset.setLastValue(value);
}

void setResonance(float value){
  filter.resonance.setLastValue(value);
}
// function for VCA + EG
void setAmplitude(float value){
  vcaLfo.amplitude.setLastValue(value / 2.0 * vcaLfoIntensityKnob.getValue());
  vcaLfo.offset.setLastValue(value);
}
void setParameters(){
  adsr1.setParameters(1.0, attackKnob.getValue(), decayReleaseKnob.getValue(), sustainKnob.getValue(), decayReleaseKnob.getValue(), 0.0, 0.0);
}
void setAttack(){
  setParameters();
}
void setSustain(){
  setParameters();
}
void setDecayRelease(){
  setParameters();
}

// functions for LFO
void setLfoWave(boolean value){
   if(value){
     vcoLfo.setWaveform(Waves.SINE);
     vcfLfo.setWaveform(Waves.SINE);
     vcaLfo.setWaveform(Waves.SINE);
   } else {
     vcoLfo.setWaveform(Waves.SQUARE); 
     vcfLfo.setWaveform(Waves.SQUARE); 
     vcaLfo.setWaveform(Waves.SQUARE); 
   }
}

void setLfoRate(float value){
  vcoLfo.setFrequency(value);
  vcfLfo.setFrequency(value);
  vcaLfo.setFrequency(value);
}

void setVcfIntensity(float value){
  vcfLfo.amplitude.setLastValue(cutoffFrequencyKnob.getValue() / 2.0 * value);
}
void setVcaIntensity(float value){
  vcaLfo.amplitude.setLastValue(amplitudeKnob.getValue() / 2.0 * value);
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
      vcoLfo.amplitude.setLastValue(Frequency.ofPitch(tone + octave).asHz() / 2.0 * vcoLfoIntensity);
      vcoLfo.offset.setLastValue(Frequency.ofPitch(tone + octave).asHz());
      adsr1.unpatch(out);
      adsr1.noteOn();
      adsr1.patch(out);
      isKeyLocked = true;
      lockedKey = key;
    }
  }
}

void keyReleased(){
  if(isKeyLocked && key == lockedKey){
    adsr1.unpatchAfterRelease(out);
    adsr1.noteOff();
    isKeyLocked = false;
  }
}


void draw(){
}

  
void setupGUI(){
  cp5 = new ControlP5(this);
  // GUI for VCO
  text("VCO", width / 4.0 * 1.0, height / 4.0 * 0.5);
  //cp5.addToggle("setVcoWave")
  //   .setLabel("VCO WAVE")
  //   .setValue(true)
  //   .setPosition(width / 4.0 * 1.0 - toggleSize.x / 2.0, height / 4.0 * 1.0 - toggleSize.y / 2.0)
  //   .setSize(int(toggleSize.x), int(toggleSize.y))
  //   .setMode(ControlP5.SWITCH);
  
  cp5.addKnob("setVcoWave")
     .setLabel("VCO WAVE")
     .setRange(0,4)
     .setValue(0)
     .setPosition(width / 4.0 * 1.0 - toggleSize.x / 2.0, height / 4.0 * 1.0 - toggleSize.y / 2.0)
     .setSize(int(toggleSize.x), int(toggleSize.y))
     .setRadius(knobRadius)
     .setNumberOfTickMarks(4)
     .setTickMarkLength(3)
     .snapToTickMarks(true); 

  cp5.addKnob("octave")
     .setLabel("OCTAVE")
     .setRange(2, 6)
     .setValue(4)
     .setPosition(width / 4.0 * 1.0 - knobRadius, height / 4.0 * 2.0 - knobRadius)
     .setRadius(knobRadius)
     .setNumberOfTickMarks(4)
     .setTickMarkLength(5)
     .snapToTickMarks(true); 
          
  // GUI for VCF
  text("VCF", width / 4.0 * 2.0, height / 4.0 * 0.5);
  cutoffFrequencyKnob = cp5.addKnob("setCutoffFrequency")
                           .setLabel("CUTOFF FREQUENCY")
                            .setRange(0, 10000)
                           .setValue(10000)
                           .setPosition(width / 4.0 * 2.0 - knobRadius, height / 4.0 * 1.0 - knobRadius)
                           .setRadius(knobRadius);

  cp5.addKnob("setResonance")
     .setLabel("RESONANCE")
     .setRange(0, 1)
     .setValue(0)
     .setPosition(width / 4.0 * 2.0 - knobRadius, height / 4.0 * 2.0 - knobRadius)
     .setRadius(knobRadius);
     
  // GUI for VCA + EG
  text("VCA + EG", width / 4.0 * 3.0, height / 7.0 * 0.5);
  amplitudeKnob = cp5.addKnob("setAmplitude")
                     .setLabel("AMPLITUDE")
                     .setRange(0, 1)
                     .setValue(0.5)
                     .setPosition(width / 4.0 * 3.0 - knobRadius, height / 7.0 * 1.0 - knobRadius)
                     .setRadius(knobRadius);
  attackKnob = cp5.addKnob("setAttack")
                  .setLabel("ATTACK")
                  .setRange(0.01, 5.0)
                  .setValue(0.01)
                  .setPosition(width / 4.0 * 3.0 - knobRadius, height / 7.0 * 2.0 - knobRadius)
                  .setRadius(knobRadius);
  sustainKnob = cp5.addKnob("setSustain")
                   .setLabel("SUSTAIN")
                   .setRange(0, 1.0)
                   .setValue(0.5)
                   .setPosition(width / 4.0 * 3.0 - knobRadius, height / 7.0 * 3.0 - knobRadius)
                   .setRadius(knobRadius); 
  decayReleaseKnob = cp5.addKnob("setDecayRelease")
                        .setLabel("DECAY / RELEASE")
                        .setRange(0.01, 5.0)
                        .setValue(1.0)
                        .setPosition(width / 4.0 * 3.0 - knobRadius, height / 7.0 * 4.0 - knobRadius)
                        .setRadius(knobRadius);  
  // GUI for LFO
  text("LFO", width / 2.0, height / 7.0 * 5.0);
  cp5.addToggle("setLfoWave")
     .setLabel("LFO WAVE")
     .setValue(true)
     .setPosition(width / 6.0 * 1.0 - toggleSize.x / 2.0, height / 7.0 * 6.0 - toggleSize.y / 2.0)
     .setSize(int(toggleSize.x), int(toggleSize.y))
     .setMode(ControlP5.SWITCH);
  cp5.addKnob("setLfoRate")
     .setLabel("RATE")
     .setRange(0, 100)
     .setValue(10)
     .setPosition(width / 6.0 * 2.0 - knobRadius, height / 7.0 * 6.0 - knobRadius)
     .setRadius(knobRadius);  
   cp5.addKnob("vcoLfoIntensity")
     .setLabel("VCO INTENSITY")
     .setRange(0.0, 1.0)
     .setValue(0.0)
     .setPosition(width / 6.0 * 3.0 - knobRadius, height / 7.0 * 6.0 - knobRadius)
     .setRadius(knobRadius);  
  vcfLfoIntensityKnob = cp5.addKnob("setVcfIntensity")
                           .setLabel("VCF INTENSiTY")
                           .setRange(0.0, 1.0)
                           .setValue(0.0)
                           .setPosition(width / 6.0 * 4.0 - knobRadius, height / 7.0 * 6.0 - knobRadius)
                           .setRadius(knobRadius);  
   vcaLfoIntensityKnob = cp5.addKnob("setVcaIntensity")
                            .setLabel("VCA INTENSITY")
                            .setRange(0.0, 1.0)
                            .setValue(0.0)
                            .setPosition(width / 6.0 * 5.0 - knobRadius, height / 7.0 * 6.0 - knobRadius)
                            .setRadius(knobRadius); 
}
