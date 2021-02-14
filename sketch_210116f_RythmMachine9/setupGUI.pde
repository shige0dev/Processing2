float Amp1, Freq1, A1, D1, S1, R1, ModAmp1, ModFreq1;
float Amp2, Freq2, A2, D2, S2, R2, ModAmp2, ModFreq2;
int WaveForm1, WaveForm2;
int ModForm1,ModForm2;
Knob Kbpm,KgateTime;

void setupGUI() {
  cp5 = new ControlP5(this);
  float knobRadius = 25;
  PVector toggleSize = new PVector(30, 30); 
  PVector bangSize = new PVector(20, 20); 
  toggles = new Toggle[7][16];
 
  cp5.addKnob("bpm")
    .setRange(60, 240)
    .setValue(120)
    .setPosition( width/14 * 9- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
    
  cp5.addKnob("gateTime")
    .setRange(0.1, 0.5)
    .setValue(0.2)
    .setPosition( width/14 * 10- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  cp5.addKnob("SoundSelect")
    .setRange(1, 6)
    .setValue(1)
    .setNumberOfTickMarks(5)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 3- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  

  cp5.addKnob("Amp1")
    .setRange(0, 1)
    .setValue(0.2)
    .setPosition( width/14 * 3- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  cp5.addKnob("WaveForm1")
    .setRange(0, 6)
    .setValue(0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 4- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);   
  cp5.addKnob("Freq1")
    .setRange(0, 127)
    .setValue(64)
    .setPosition( width/14 * 5- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  cp5.addKnob("A1")
    .setRange(0.01, 0.5)
    .setValue(0.05)
    .setPosition( width/14 * 6- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  cp5.addKnob("D1")
    .setRange(0.01, 2)
    .setValue(0.5)
    .setPosition( width/14 * 7- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  //cp5.addKnob("S1")
  //  .setRange(0, 1)
  //  .setValue(0.0)
  //  .setPosition( width/14 * 9- knobRadius, height/8 * 2 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);  
  //cp5.addKnob("R1")
  //  .setRange(0, 1)
  //  .setValue(0.0)
  //  .setPosition( width/14 * 10- knobRadius, height/8 * 2 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);
  
  cp5.addKnob("ModAmp1")
    .setRange(-63, 63)
    .setValue(0)
    .setPosition( width/14 * 8- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  cp5.addKnob("ModForm1")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 9- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  cp5.addKnob("ModFreq1")
    .setRange(1, 100)
    .setValue(4)
    .setPosition( width/14 * 10- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
 
  cp5.addKnob("WaveForm2")
    .setRange(0, 6)
    .setValue(0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(4)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 4- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  cp5.addKnob("Amp2")
    .setRange(0, 1)
    .setValue(0.2)
    .setPosition( width/14 * 3- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);      
  cp5.addKnob("Freq2")
    .setRange(0, 127)
    .setValue(64)
    .setPosition( width/14 * 5- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  

  cp5.addKnob("A2")
    .setRange(0.01, 0.5)
    .setValue(0.01)
    .setPosition( width/14 * 6- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  cp5.addKnob("D2")
    .setRange(0.01, 2)
    .setValue(0.5)
    .setPosition( width/14 * 7- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  //cp5.addKnob("S2")
  //  .setRange(0, 1)
  //  .setValue(0.5)
  //  .setPosition( width/14 * 9- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);  
  //cp5.addKnob("R2")
  //  .setRange(0, 1)
  //  .setValue(0.5)
  //  .setPosition( width/14 * 10- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);
  
  cp5.addKnob("ModAmp2")
    .setRange(-63, 63)
    .setValue(0)
    .setPosition( width/14 * 8- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  cp5.addKnob("ModForm2")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 9- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  cp5.addKnob("ModFreq2")
    .setRange(1, 100)
    .setValue(4)
    .setPosition( width/14 * 10- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  cp5.addKnob("Send")
    .setRange(0, 127)
    .setValue(0)
    .setPosition( width/14 * 11- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  cp5.addKnob("Tune")
    .setRange(0, 127)
    .setValue(0)
    .setPosition( width/14 * 12- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);


  for (int j = 0; j < 7; j++) {
    for (int i = 0; i < 16; i++) {
      toggles[j][i] = cp5.addToggle("sound"+ j +""+ (i + 1))
        .setCaptionLabel("")
        .setValue(false)
        .setPosition(width / (22 + 1) * (i + 5) - toggleSize.x / 2, height / 14 * ( j + 7) - toggleSize.y / 2)
        .setLabel("")
        .setSize(int(toggleSize.x), int(toggleSize.y));
    }
  }

  for (int j = 0; j < 6; j++) {
    cp5.addBang("bang"+(j+1))
      .setPosition(width / (22 + 1) * 4 - toggleSize.x / 2, height / 14 * (j+8) - toggleSize.y / 2)
      .setSize( int(bangSize.x), int(bangSize.y))
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("bang");
  }
}
