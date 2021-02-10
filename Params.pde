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