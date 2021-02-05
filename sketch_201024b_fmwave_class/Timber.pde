class Timber{
  int time;
  float tone;
  float freq;
  float LEVEL_A, LEVEL_B, LEVEL_C;
  float OCT_RATIO_A, OC_RATIOT_B, OCT_RATIO_C;
  float phase, phase1, phase2;
  int trigger;
  
Timber(float _tone){
    tone = _tone;
    time = 0;
    freq = 0;
    LEVEL_A = 1.0;
    LEVEL_B = 0.3;
    LEVEL_C = 0.0;
    OCT_RATIO_A = 1.0;
    OCT_RATIO_B = 2.0;
    OCT_RATIO_C = 1.0;
    phase = 0;
    phase1 = 0;
    phase2 = 0;
    trigger = 0;
    adsr1 = new ADSR( 0.0, 20.0, 10.0, 0.8, 40.0, 48.0);
    //adsr2 = new ADSR( 0.0, 3.0, 3.0, 0.01, 20.0, 10.0);
    //adsr3 = new ADSR( 0.0, 2.0, 2.0, 0.01, 30.0, 10.0);    
}
  
  float update(){
    time++;
    freq = tone*2;    //周波数をトーンから設定
    phase += freq;    //周波数分進める
    phase1 = SAMPLE_RATE * LEVEL_C* fm_calc( OCT_RATIO_C* phase + 0);
    phase2 = SAMPLE_RATE * LEVEL_B* fm_calc( OCT_RATIO_B* phase + phase1);
    sound_val =  100     * LEVEL_A* fm_calc( OCT_RATIO_A* phase + phase2);
    adsr1.update(trigger);
//    adsr2.update(trigger);
//    adsr3.update(trigger);
    return sound_val * adsr1.val;
  }

  void trigger_on(float _tone){
    tone = _tone;
    time = 0;
    phase = 0;
    phase1 = 0;
    phase2 = 0;
    trigger = 1;
    println("asa");
  }
  
  void trigger_off(){
    trigger = 0;
  }
  
  boolean isBusy(){
    return (adsr1.time != 0);
  }
}
