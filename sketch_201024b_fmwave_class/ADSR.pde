class ADSR {
  int time;
  float delay_time, attack_time, decay_time, sustain_level, release_time;
  float val, val_released;
  int trigger;
  int stage;

  ADSR(float _delay_time,float _attack_time, float _decay_time, float _sustain_level, float _release_time, float SAMPLE_RATE) {
    //println("adsr created");
    delay_time    = _delay_time;
    attack_time   = max( 0.1, _attack_time * SAMPLE_RATE);   //ms
    decay_time    = max( 0.1, _decay_time  * SAMPLE_RATE);   //ms
    sustain_level = max(0.01, _sustain_level);
    release_time  = max( 0.1, _release_time* SAMPLE_RATE);   //ms
    val = 0;
    stage = 0;
  }

  float update(int _trigger) {
    trigger = _trigger;
    time++;
    //状態判定
    if (trigger == 1) {
      if (stage == 4 | stage == 0) {
        stage = 1;                            //0 ->Attack
      }
      if ( stage == 1 & val > 1) {
        stage = 2;                            //Attack->Decay
        val=1;
      }
      if (stage == 2 & val < sustain_level) {
        stage=3;                             //Decay -> Sustain
        val = sustain_level;
      }
    } else {
      stage = 4;                         //Release
    }

    //増減演算
    if (stage == 1) {
      val += 1/attack_time;
      val_released = val;
      //println("A");
    }
    if (stage == 2) {
      val -= (1-sustain_level)/decay_time;
      val_released = val;
      //println("D");
    }
    if (stage == 3) {
      //println("S");
    }
    if (stage == 4) {
      val -= 2*val_released/release_time;
      //println("R");
    }

    if (val <= 0) {
      //println("OFF");
      val = 0;
      stage = 0;
      time = 0;
    }

    return val;
  }
}
