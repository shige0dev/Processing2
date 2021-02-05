import processing.sound.*;

SoundFile soundfile;

Amplitude rms;

void setup(){
size(800,600);
fill(0,127,255);
rectMode(CENTER);
noStroke();
soundfile= new SoundFile(this,"sample.mp3");
soundfile.loop();
rms=new Amplitude(this);
rms.input(soundfile);
}
void draw(){
background(0);
float a=map(rms.analyze(),0.0,1.0,0.0,width);
rect(width/2,height/2,a,a);
}
