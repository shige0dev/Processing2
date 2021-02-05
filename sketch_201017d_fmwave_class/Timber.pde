class Timber{
  int time;
  float tone;
  float freq;
  float LEVEL_A, LEVEL_B, LEVEL_C;
  float OCT_A, OCT_B, OCT_C;
  float attack_time,decay_time,sustain_level,release_time;
  float phase, phase1, phase2;
  float EG;
  boolean key_on;
  
Timber(float _tone){
    tone = _tone;
    freq = 0;
    LEVEL_A = 1.0;
    LEVEL_B = 0.3;
    LEVEL_C = 0.0;
    OCT_A = 1.0;
    OCT_B = 2.0;
    OCT_C = 1.0;
    attack_time   = 0.1*4800;
    decay_time    = 0.1*4800;
    sustain_level = 0.5;
    release_time  = 0.1*4800;
    phase = 0;
    phase1 = 0;
    phase2 = 0;
    EG = 0;
    key_on = false;
  }
  
  float update(){
    freq = tone*2;
    phase += freq;
    phase1 = SAMPLE_RATE * LEVEL_C* fm( OCT_C*phase + 0);
    phase2 = SAMPLE_RATE * LEVEL_B* fm( OCT_B*phase + phase1);
    if(key_on == true){ 
      if( time < attack_time){
       // println("a");
        EG += 2*1/attack_time;                  //Attack
      } else if(EG > sustain_level){
       // println("d");
//        EG -= 2*(1-sustain_level)/decay_time;   //Decay
         EG -= 2*(1-sustain_level)/decay_time;
      }else{
       //  println("s");          //Susteen
      }
    }else{
       // println("r"); 
        EG -= 2*sustain_level/release_time;       //Release
    }

    time++;
    if(EG<0){
      EG = 0.0;
      time = 0;
    }
     //println(EG);

    return 100 * EG * LEVEL_A* fm( OCT_A*phase + phase2);
  }

  void start(float _tone){
    tone = _tone;
    time = 0;
    EG = 0; 
    phase = 0;
    phase1 = 0;
    phase2 = 0;

    key_on = true;
  }
}
