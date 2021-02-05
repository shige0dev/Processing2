class ADSR {
  int time;
  float attack_time, decay_time, sustain_level, release_time;
  float val,val_released;
  int trigger;
  int stage;

  ADSR(float _a, float _d, float _s, float _r, float SAMPLE_RATE) {
    attack_time   = _a* SAMPLE_RATE;   //ms
    decay_time    = _d* SAMPLE_RATE;   //ms
    sustain_level = _s;
    release_time  = _r* SAMPLE_RATE;   //ms
    val = 0;
    stage = 0;
    println("adsr created");
  }

  float update(int _trigger) {
    if(trigger < _trigger)time= 0;
    trigger = _trigger;
    time++;
    if (trigger == 1) { 
      if ( stage =0 & val <= 1) {
        val += 1/attack_time;
        val_released = val;                    //Attack
        println("a"); 
        println(val);
      } else if (val > sustain_level) {
        val -= (1-sustain_level)/decay_time;   //Decay
        val_released = val;
        println("d"); 
        println(val);
      } else {
        println("s");                          //Susteen 
      } 
    } else if(val > 0) {
      ///println("r"); 
      val -= 2*val_released/release_time;       //Release
    } 
    
    if (stage == 0){
    val += 1/attack_time;
    val_releaseed = val;
  }
    if (stage == 1){
    val -= (1-sustain_level)/decay_time;)
  }
    if (stage == 3){val -= 2*val_released/release_time;}
    
    if(val <= 0){
      //println("OFF");
      time = 0;
      val = 0;
    }

    return val;
  }
}
