float AMP1,F1,A1,D1,S1,R1,MODAmp1,MODFreq1;
float AMP2,F2,A2,D2,S2,R2;
int Waveform1,Waveform2;

void setupGUI() {
  cp5 = new ControlP5(this);
  float knobRadius = 25;
  PVector toggleSize = new PVector(30, 30); 
  PVector bangSize = new PVector(20, 20); 

  cp5.addKnob("bpm")
    .setRange(60, 240)
    .setValue(120)
    .setPosition( width/14 * 1- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
    
  cp5.addKnob("gateTime")
    .setRange(0.1, 0.5)
    .setValue(0.2)
    .setPosition( width/14 * 2- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
    
  moogFilter = 
  cp5.addKnob("filter")
    .setRange(50, 12000)
    .setValue(8000)
    .setPosition( width/14 * 3- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);     

  cp5.addKnob("Waveform1")
    .setRange(0, 7)
    .setValue(0)
    .setNumberOfTickMarks(7)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 4- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  cp5.addKnob("AMP1")
    .setRange(0, 1)
    .setValue(0.5)
    .setPosition( width/14 * 5- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);      
    
  cp5.addKnob("F1")
    .setRange(0, 127)
    .setValue(64)
    .setPosition( width/14 * 6- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
    
  cp5.addKnob("A1")
    .setRange(0.01, 1.0)
    .setValue(0.02)
    .setPosition( width/14 * 7- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  cp5.addKnob("D1")
    .setRange(0.01, 2)
    .setValue(1.0)
    .setPosition( width/14 * 8- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  cp5.addKnob("S1")
    .setRange(0, 1)
    .setValue(0.0)
    .setPosition( width/14 * 9- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  cp5.addKnob("R1")
    .setRange(0.0, 1)
    .setValue(0.0)
    .setPosition( width/14 * 10- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

 cp5.addKnob("MODform1")
    .setRange(0, 6)
    .setValue(0.0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 11- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  cp5.addKnob("MODAmp1")
    .setRange(-5.0, 5.0)
    .setValue(0.0)
    .setPosition( width/14 * 12- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  cp5.addKnob("MODFreq1")
    .setRange(1, 255)
    .setValue(10)
    .setPosition( width/14 * 13- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
    
    
    
  cp5.addKnob("Waveform2")
    .setRange(0, 6)
    .setValue(0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 4- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  cp5.addKnob("AMP2")
    .setRange(0, 1)
    .setValue(0.5)
    .setPosition( width/14 * 5- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);      
    
  cp5.addKnob("F2")
    .setRange(0, 127)
    .setValue(220)
    .setPosition( width/14 * 6- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
    
  cp5.addKnob("A2")
    .setRange(0.01, 1.0)
    .setValue(0.05)
    .setPosition( width/14 * 7- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  cp5.addKnob("D2")
    .setRange(0.01, 1)
    .setValue(0.1)
    .setPosition( width/14 * 8- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  cp5.addKnob("S2")
    .setRange(0, 1)
    .setValue(0.9)
    .setPosition( width/14 * 9- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  cp5.addKnob("R2")
    .setRange(0.01, 1)
    .setValue(0.1)
    .setPosition( width/14 * 10- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

 cp5.addKnob("MODform2")
    .setRange(0, 6)
    .setValue(0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 11- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  cp5.addKnob("MODAmp2")
    .setRange(0, 1.0)
    .setValue(0.1)
    .setPosition( width/14 * 12- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  cp5.addKnob("MODFreq2")
    .setRange(1, 100)
    .setValue(10)
    .setPosition( width/14 * 13- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
    
}
