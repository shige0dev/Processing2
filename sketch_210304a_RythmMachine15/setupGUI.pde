Knob Bpm,Parts;
Knob Amp1,Amp2;
Knob Freq1, A1, D1, ModAmp1, ModFreq1;
Knob Freq2, A2, D2, ModAmp2, ModFreq2;
Knob WaveForm1, WaveForm2;
Knob ModForm1 , ModForm2;
Knob BitCrush1, BitCrush2;
Knob OverDrive1,OverDrive2;
Knob Fold1,Fold2;
Toggle[][] toggles;
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
  Parts = cp5.addKnob("parts")
    .setRange(0, 5)
    .setValue(1)
    .setNumberOfTickMarks(5)
    .snapToTickMarks(true)
    .setTickMarkLength(1)
    .setPosition( width/14 * 2- knobRadius, height/8 * 1 - knobRadius)
    .setDragDirection(Knob.VERTICAL)
    .setRadius(knobRadius);
  
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
    .setRange(0.001, 1.0)
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

void setGUIValue(){
    //println("setValue");
    WaveForm1.setValue(params[Number][0].waveform );
    Amp1.setValue(params[Number][0].amp );
    Freq1.setValue(params[Number][0].freq );
    A1.setValue(params[Number][0].a );
    D1.setValue(params[Number][0].d );
    ModForm1.setValue(params[Number][0].modform );
    ModAmp1.setValue(params[Number][0].modamp);
    ModFreq1.setValue(params[Number][0].modfreq);
    BitCrush1.setValue(params[Number][0].bitcrush);
    OverDrive1.setValue(params[Number][0].overdrive);
    Fold1.setValue(params[Number][0].fold);
   // Pan1.setValue(_params1.pan1);

    WaveForm2.setValue(params[Number][1].waveform );
    Amp2.setValue(params[Number][1].amp );
    Freq2.setValue(params[Number][1].freq );
    A2.setValue(params[Number][1].a );
    D2.setValue(params[Number][1].d );
    ModForm2.setValue(params[Number][1].modform );
    ModAmp2.setValue(params[Number][1].modamp);
    ModFreq2.setValue(params[Number][1].modfreq);
    BitCrush2.setValue(params[Number][1].bitcrush);
    OverDrive2.setValue(params[Number][1].overdrive);
    Fold2.setValue(params[Number][1].fold);
}

void getGUIValue() {
    //println("getValue");
    params[Number][0].waveform = int(WaveForm1.getValue());
    params[Number][0].amp = Amp1.getValue();
    params[Number][0].freq= Freq1.getValue();
    params[Number][0].a = A1.getValue();
    params[Number][0].d = D1.getValue();
    params[Number][0].modform = int(ModForm1.getValue());
    params[Number][0].modamp  = ModAmp1.getValue();
    params[Number][0].modfreq = ModFreq1.getValue();
    params[Number][0].bitcrush = BitCrush1.getValue();
    params[Number][0].overdrive = OverDrive1.getValue();
    params[Number][0].fold = Fold1.getValue();    

    params[Number][1].waveform = int(WaveForm2.getValue());
    params[Number][1].amp = Amp2.getValue();
    params[Number][1].freq= Freq2.getValue();
    params[Number][1].a = A2.getValue();
    params[Number][1].d = D2.getValue();
    params[Number][1].modform = int(ModForm2.getValue());
    params[Number][1].modamp  = ModAmp2.getValue();
    params[Number][1].modfreq = ModFreq2.getValue();
    params[Number][1].bitcrush = BitCrush2.getValue();
    params[Number][1].overdrive = OverDrive2.getValue();
    params[Number][1].fold = Fold2.getValue();    
  }
  
  
