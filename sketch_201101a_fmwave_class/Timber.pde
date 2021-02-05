class Voice {
  boolean soundOn;
  float tone;
  float freq;
  float LEVEL_A, LEVEL_B, LEVEL_C;
  float OCT_RATIO_A, OCT_RATIO_B, OCT_RATIO_C;
  float phase;
  float phase0, phase1, phase2;
  ADSR adsr0,adsr1,adsr2;
  int gate;  
  
  Voice(float _tone) {
    tone = _tone;
    
    //Initialize parametar
    soundOn = false;
    freq = 0;
    LEVEL_A = 1.0;
    LEVEL_B = 0.3;
    LEVEL_C = 0.0;
    OCT_RATIO_A = 1.0;
    OCT_RATIO_B = 1.0;
    OCT_RATIO_C = 1.0;
    phase = 0;
    phase0 = 0;
    phase1 = 0;
    phase2 = 0;
    gate = 0;

    //Create 3EG
    adsr0 = new ADSR(0);
    adsr1 = new ADSR(1);
    adsr2 = new ADSR(2);
  }

  float update() {
    freq = tone*2;    //周波数をトーンから設定
    phase += freq;    //周波数分進める
    adsr0.update(gate);
    adsr1.update(gate);
    adsr2.update(gate);
    switch(1) {
    case 1:
      phase0 = adsr0.val * SAMPLE_RATE * LEVEL_C* fm_calc( OCT_RATIO_C* phase + 0);
      phase1 = adsr1.val * SAMPLE_RATE * LEVEL_B* fm_calc( OCT_RATIO_B* phase + phase0);
      phase2 = adsr2.val * SAMPLE_RATE * LEVEL_A* fm_calc( OCT_RATIO_A* phase + phase1);
      sound_val = phase2 * 100; 
      break;
    case 2:
      phase0 =  SAMPLE_RATE * LEVEL_C* fm_calc( OCT_RATIO_C* phase + 0);
      phase1 =  SAMPLE_RATE * LEVEL_B* fm_calc( OCT_RATIO_B* phase + 0);
      phase2 =  SAMPLE_RATE * LEVEL_A* fm_calc( OCT_RATIO_A* phase + 0);
      sound_val = phase0*100 + phase1 * 100 + phase2*100;
      break;
    }
    if( adsr0.val == 0 & adsr1.val == 0 & adsr2.val == 0){
      tone = 0;
      soundOn = false;
    } else soundOn = true;
    return sound_val;
  }

  boolean gate_on(int _tone) {
    if (gate == 1)return false;
    println(tone);
    tone = _tone;
    soundOn = true;
    phase = 0;
    gate = 1;
    return true;
  }

  boolean gate_off(int _tone) {
    if (tone == _tone) {
      gate = 0;
      return true;
    } else {
      return false;
    }
  }
}
