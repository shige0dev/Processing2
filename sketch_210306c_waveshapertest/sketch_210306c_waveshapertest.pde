/**
* Minim WaveShaper 
*
* @author aa_debdeb
* @date 2016/11/24
*/

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
Oscil wave;
Wavetable table;
WaveShaper shaper;
//Constant constant;

void setup(){
  size(200, 200);
  frameRate(60);
  minim = new Minim(this);
  
  out = minim.getLineOut();
  wave = new Oscil(220, 1.0, Waves.SAW);
//  wave = new Oscil(100, 1.0, new Wavetable(new float[]{0,-1.0,-0.9,-0.8,-0.7,-0.6,-0.5,-0.4,-0.3,-0.2,-0.1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,0 }) );  
//  table = new Wavetable(new float[]{ -1 ,0, 1, 0.5, 0, -0.5, -1, -0.5,    0   , 0.5, 1, 0.5,  0, -0.5, -1, 0, 1} );   //fold10
  table = new Wavetable(new float[]{ -1, 1, -1, -0.5,    0   , 0.5, 1,   -1,  1 } );   //fold10

//  table = new Wavetable(new float[]{0,-1,0,1,0,-1,0,1,0,-1, 0 ,1,0,-1,0,1,0,-1,0,1,0});   //fold10
//  table = new Wavetable(new float[]{-1,-1,-1,-1,-1,-1,-1,-1,-0.9,-0.6, 0 ,0.6,0.9,1,1,1,1,1,1,1,1}); //overdrive 
  shaper = new WaveShaper(2.0, 0.5, table);
//  constant = new Constant(1.0);
    
  wave.patch(shaper);
  shaper.patch(constant).patch(out);
}

void draw(){
  background(0);
  stroke(255);
  for(int i = 0; i < out.bufferSize() - 1; i++){
    line(i, 50 + out.left.get(i) * 40, i + 1,  50 + out.left.get(i + 1) * 40);
    line(i, 150 + out.right.get(i) * 40, i + 1,  150 + out.right.get(i + 1) * 40);
  }
  
  strokeWeight(3);
  noFill();
  beginShape();
  float[] array = table.getWaveform();
  for(int i = 0; i < array.length; i++){
    vertex(map(i,0,array.length-1,0,width) , height / 2 - array[i]* height/3);
  }
  endShape();
  
    stroke(0);
  strokeWeight(1);
  noFill();
  

}

void mouseMoved(){
//  wave.setFrequency(110);
  //float value = map(mouseY, 0, width, 0.0, 1.0);
  //constant.setConstant(value);
  float mapAmp = abs(map(mouseX, 0, height, -1.0, 1.0));
  shaper.outAmplitude.setLastValue(max(1, 0.5/mapAmp));
  shaper.mapAmplitude.setLastValue(mapAmp);
//  println(max(1, 0.1/mapAmp));

}
