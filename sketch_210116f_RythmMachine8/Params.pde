class Params {
  float freq1,freq2;
  float amp1,amp2;
  float a1, a2;
  float d1, d2;
  float s1, s2;
  float r1, r2;
  float modamp1,modfreq1;

  Params() {
    update();
    //freq1 = 440;
    //freq2 = 440;
    //amp1 = 0.3;
    //amp2 = 0.3;
    //a1 = 0.01;
    //a2 = 0.3;
    //d1 = 0.5;
    //d2 = 0.5;
    //s1 = 0.5;
    //s2 = 0.5;
    //r1 = 0.1;
    //r2 = 0.7;
  }
  
  void update(){
    amp1=AMP1;
    freq1=F1;
    a1 = A1;
    d1 = D1;
    s1 = S1;
    r1 = R1;
    modamp1 = MODAmp1;
    modfreq1 = MODFreq1;
    
    amp2 = AMP2;
    freq2 = F2;
    a2 = A2;
    d2 = D2;
    s2 = S2;
    r2 = R2;
}
}
