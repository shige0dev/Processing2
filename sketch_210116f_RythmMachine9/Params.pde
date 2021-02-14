class Params {
  float freq1, freq2;
  float amp1, amp2;
  float a1, a2;
  float d1, d2;
  //float s1, s2;
  //float r1, r2;
  float modamp1;
  float modfreq1;
  float modform1;
  float modamp2;
  float modfreq2;
  float modform2;

  Params() {
    update();
  }

  void update() {
    amp1=Amp1;
    freq1=Freq1;
    a1 = A1;
    d1 = D1;
    //s1 = S1;
    //r1 = R1;
    modamp1 = ModAmp1;
    modform1 = ModForm1;
    modfreq1 = ModFreq1;

    amp2 = Amp2;
    freq2 = Freq2;
    a2 = A2;
    d2 = D2;
    //s2 = S2;
    //r2 = R2;
    modamp2 = ModAmp2;
    modform2 = ModForm2;    
    modfreq2 = ModFreq2;    
  }
}
