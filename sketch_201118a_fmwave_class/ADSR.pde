class ADSR {
  //float delay_time    = 0.0;
  //float attack_time   = 0.1;
  //float decay_time    = 0.1;
  //float sustain_level = 1.0;
  //float release_time  = 0.1;
  float val, val_released;
  int gate;
  int stage;
  int NUM;

  ADSR(int _num) {
    println("adsr created");
    NUM = _num;
    val = 0;
    stage = 0;
  }
  
  //void set_ADSR(float _delay_time,float _attack_time, float _decay_time, float _sustain_level, float _release_time){
  //  delay_time    = _delay_time;
  //  attack_time   = max( 0.1, _attack_time * sample_rate);
  //  decay_time    = max( 0.1, _decay_time  * sample_rate);
  //  sustain_level = max(0.01, _sustain_level);
  //  release_time  = max( 0.1, _release_time* sample_rate);
  //}

  float update(int _gate) {
    gate = _gate;
    //状態判定
    if (gate == 1) {
      if (stage == 4 | stage == 0) {
        stage = 1;                            //0 ->Attack
      }
      if ( stage == 1 & val > 1) {
        stage = 2;                            //Attack->Decay
        val=1;
      }
      if (stage == 2 & val < sustain_level[NUM]) {
        stage=3;                             //Decay -> Sustain
        val = sustain_level[NUM];
      }
    } else {
      stage = 4;                         //Release
    }

    //増減演算
    if (stage == 1) {
      val += 1/attack_time[NUM];
      val_released = val;
      //println("A");
    }
    if (stage == 2) {
      val -= (1-sustain_level[NUM])/decay_time[NUM];
      val_released = val;
      //println("D");
    }
    if (stage == 3) {
      //println("S");
    }
    if (stage == 4) {
      val -= 2*val_released/release_time[NUM];
      //println("R");
    }

    if (val <= 0) {
      //println("OFF");
      val = 0;
      stage = 0;
    }

    return val;
  }
}
