class Params {
  int   waveform1,waveform2;
  float amp1 , amp2;
  float freq1, freq2;
  float a1, a2;
  float d1, d2;
  //float s1, s2;
  //float r1, r2;
  int   modform1,modform2;
  float modamp1 ,modamp2;
  float modfreq1,modfreq2;
  float bitcrush1,bitcrush2;
  float overdrive1,overdrive2;
  float fold1,fold2;
  //float pan1,pan2;
  
  Params() {
    update();
  }

  void update() {
    waveform1 = int(WaveForm1.getValue());
    amp1 = Amp1.getValue();
    freq1= Freq1.getValue();
    a1 = A1.getValue();
    d1 = D1.getValue();
    //s1 = S1;
    //r1 = R1;
    modform1 = int(ModForm1.getValue());
    modamp1  = ModAmp1.getValue();
    modfreq1 = ModFreq1.getValue();
    bitcrush1 = BitCrush1.getValue();
    overdrive1 = OverDrive1.getValue();
    fold1 = Fold1.getValue();    
  //  pan1 = Pan1.getValue();
    
    waveform2 = int(WaveForm2.getValue());
    amp2 = Amp2.getValue();
    freq2 = Freq2.getValue();
    a2 = A2.getValue();
    d2 = D2.getValue();
    //s2 = S2;
    //r2 = R2;
    modform2 = int(ModForm2.getValue());    
    modamp2  = ModAmp2.getValue();
    modfreq2 = ModFreq2.getValue(); 
    bitcrush2 = BitCrush2.getValue();
    overdrive2 = OverDrive2.getValue();
    fold2 = Fold2.getValue();
  //  pan2 = Pan2.getValue();
  }
}
