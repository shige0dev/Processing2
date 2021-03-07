Knob Bpm,GateTime;
Knob Amp1,Amp2;
Knob Freq1, A1, D1, ModAmp1, ModFreq1;
Knob Freq2, A2, D2, ModAmp2, ModFreq2;
Knob WaveForm1, WaveForm2;
Knob ModForm1 , ModForm2;
Knob BitCrush1, BitCrush2;
Knob OverDrive1,OverDrive2;
Knob Fold1,Fold2;
Knob Pan1,Pan2;

int Number = 1;

void setupGUI() {
  cp5 = new ControlP5(this);
  float knobRadius = 25;
  PVector toggleSize = new PVector(30, 30); 
  PVector bangSize = new PVector(20, 20); 
  toggles = new Toggle[7][16];
 
  Bpm = cp5.addKnob("bpm")
    .setRange(60, 240)
    .setValue(120)
    .setPosition( width/14 * 1- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  GateTime = cp5.addKnob("gateTime")
    .setRange(0.1, 0.5)
    .setValue(0.2)
    .setPosition( width/14 * 2- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  //Number = cp5.addKnob("Number")
  //  .setRange(1, 6)
  //  .setValue(1)
  //  .setNumberOfTickMarks(5)
  //  .snapToTickMarks(true)
  //  .setTickMarkLength(1)
  //  .setViewStyle(Knob.ARC)
  //  .setPosition( width/14 * 3- knobRadius, height/8 * 1 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);  
  
  WaveForm1 = cp5.addKnob("WaveForm1")
    .setRange(0, 6)
    .setValue(0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 2- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);   
  WaveForm2 = cp5.addKnob("WaveForm2")
    .setRange(0, 6)
    .setValue(0)
    .setNumberOfTickMarks(6)
    .snapToTickMarks(true)
    .setTickMarkLength(4)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 2- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  
  Amp1 = cp5.addKnob("Amp1")
    .setRange(0, 1)
    .setValue(0.2)
    .setPosition( width/14 * 3- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  Amp2 = cp5.addKnob("Amp2")
            .setRange(0, 1)
            .setValue(0.2)
            .setPosition( width/14 * 3- knobRadius, height/8 * 3 - knobRadius)
            .setDragDirection(Knob.VERTICAL)
            .setRadius(knobRadius);   

  Freq1 = cp5.addKnob("Freq1")
    .setRange(0, 255)
    .setValue(64)
    .setPosition( width/14 * 4- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  Freq2 = cp5.addKnob("Freq2")
    .setRange(0, 255)
    .setValue(64)
    .setPosition( width/14 * 4- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);     
    
  A1 = cp5.addKnob("A1")
    .setRange(0.001, 1.0)
    .setValue(0.001)
    .setPosition( width/14 * 5- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  A2 = cp5.addKnob("A2")
    .setRange(0.001, 0.5)
    .setValue(0.001)
    .setPosition( width/14 * 5- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
    
  D1 = cp5.addKnob("D1")
    .setRange(0.01, 2)
    .setValue(0.5)
    .setPosition( width/14 * 6- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  D2 = cp5.addKnob("D2")
    .setRange(0.01, 2)
    .setValue(0.5)
    .setPosition( width/14 * 6- knobRadius, height/8 * 3 - knobRadius)
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
    //cp5.addKnob("R2")
  //  .setRange(0, 1)
  //  .setValue(0.5)
  //  .setPosition( width/14 * 10- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);
    //cp5.addKnob("S2")
  //  .setRange(0, 1)
  //  .setValue(0.5)
  //  .setPosition( width/14 * 9- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);  
  
  
  ModForm1 = cp5.addKnob("ModForm1")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 7- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  ModForm2 =cp5.addKnob("ModForm2")
    .setRange(1, 3)
    .setValue(1)
    .setNumberOfTickMarks(2)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setViewStyle(Knob.ARC)
    .setPosition( width/14 * 7- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
    
  ModAmp1 = cp5.addKnob("ModAmp1")
    .setRange(-63, 63)
    .setValue(0)
    .setPosition( width/14 * 8- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  ModAmp2 = cp5.addKnob("ModAmp2")
    .setRange(-63, 63)
    .setValue(0)
    .setPosition( width/14 * 8- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius); 
  
  ModFreq1 = cp5.addKnob("ModFreq1")
    .setRange(1, 255)
    .setValue(4)
    .setPosition( width/14 * 9- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  ModFreq2 = cp5.addKnob("ModFreq2")
    .setRange(1, 255)
    .setValue(4)
    .setPosition( width/14 * 9- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  BitCrush1 = cp5.addKnob("BitCrush1")
    .setRange(1, 16)
    .setValue(16)
    .setNumberOfTickMarks(15)
    .snapToTickMarks(true)
    .setPosition( width/14 * 10- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  BitCrush2 = cp5.addKnob("BitCrush2")
    .setRange(1, 16)
    .setValue(16)
    .setNumberOfTickMarks(15)
    .snapToTickMarks(true)
    .setPosition( width/14 * 10- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);

  OverDrive1 = cp5.addKnob("OverDrive1")
    .setRange(0.1, 1)
    .setValue(0.1)
    .setPosition( width/14 * 11- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);  
  OverDrive2 = cp5.addKnob("OverDrive2")
    .setRange(0.1, 1)
    .setValue(0.1)
    .setPosition( width/14 * 11- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);   
    
  Fold1 = cp5.addKnob("Fold1")
    .setRange(0.1, 1)
    .setValue(0.1)
    .setPosition( width/14 * 12- knobRadius, height/8 * 2 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);    
  Fold2 = cp5.addKnob("Fold2")
    .setRange(0.1, 1)
    .setValue(0.1)
    .setPosition( width/14 * 12- knobRadius, height/8 * 3 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);      

  //Pan1 = cp5.addKnob("Pan1")
  //  .setRange(-1, 1)
  //  .setValue(0)
  //  .setPosition( width/14 * 12- knobRadius, height/8 * 2 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);  
  //Pan2 = cp5.addKnob("Pan2")
  //  .setRange(-1, 1)
  //  .setValue(0)    
  //  .setPosition( width/14 * 12- knobRadius, height/8 * 3 - knobRadius)
  //  .setDragDirection(Knob.VERTICAL)
  //  .setRadius(knobRadius);      
    
    
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
  
  for (int j = 0; j < 6; j++) {
    cp5.addBang("current"+(j+1))
      .setPosition(width / (22 + 1) * 3 - toggleSize.x / 2, height / 14 * (j+8) - toggleSize.y / 2)
      .setSize( int(bangSize.x), int(bangSize.y))
      .setTriggerEvent(Bang.PRESSED)
      .setLabel("");
  }
  
  for (int j = 0; j < 6; j++) {
    cp5.addBang("Mute"+(j+1))
      .setPosition(width / (22 + 1) * 2 - toggleSize.x / 2, height / 14 * (j+8) - toggleSize.y / 2)
      .setSize( int(bangSize.x), int(bangSize.y))
      .setTriggerEvent(Bang.DOWN)
      .setLabel("");
  }
}

void setGUI(Params _params){
    WaveForm1.setValue(_params.waveform1 );
    Amp1.setValue(_params.amp1 );
    Freq1.setValue(_params.freq1 );
    A1.setValue(_params.a1 );
    D1.setValue(_params.d1 );
    ModForm1.setValue(_params.modform1 );
    ModAmp1.setValue(_params.modamp1);
    ModFreq1.setValue(_params.modfreq1);
    BitCrush1.setValue(_params.bitcrush1);
    OverDrive1.setValue(_params.overdrive1);
    Fold1.setValue(_params.fold1);
   // Pan1.setValue(_params.pan1);
    
    WaveForm2.setValue(_params.waveform2 );
    Amp2.setValue(_params.amp2 );
    Freq2.setValue(_params.freq2 );
    A2.setValue(_params.a2 );
    D2.setValue(_params.d2 );
    ModForm2.setValue(_params.modform2 );
    ModAmp2.setValue(_params.modamp2);
    ModFreq2.setValue(_params.modfreq2);    
    BitCrush2.setValue(_params.bitcrush2);
    OverDrive2.setValue(_params.overdrive2);
    Fold2.setValue(_params.fold2);
   // Pan2.setValue(_params.pan2);
}
