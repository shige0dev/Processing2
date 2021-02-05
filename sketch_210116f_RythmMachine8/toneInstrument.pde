class ToneInstrument implements Instrument
{
  // create all variables that must be used througout the class
  Oscil osc1, osc2;
  Noise noise1,noise2;
  ADSR amp_adsr0;
  ADSRexp amp_adsr1;
  ADSR mod_adsr1;
  MoogFilter filter1,filter2;
  BitCrush bitCrush1;
  Delay delay;
  Oscil mod_lfo1;
  Constant const1,const2,const0;
  Summer sum1;
  Midi2Hz cv2hz,amp_adsr1exp;
  WaveShaper distotion;
  Gain gain;
  Multiplier multiplier;
  
  
  // constructor for this instrument
  ToneInstrument( Params _params)
  { 
    cv2hz = new Midi2Hz();
    sum1 = new Summer();
    const0 = new Constant(10);
    const1 = new Constant( _params.freq1);
    const2 = new Constant( _params.modamp1);

    amp_adsr1 = new ADSRexp( 1, _params.a1, _params.d1, _params.s1, _params.r1 );
    mod_adsr1 = new ADSR( 16, 0.001, min( 4, 24/_params.modfreq1) , 0, 0 );
    mod_lfo1 = new Oscil( _params.modfreq1  , 1, Waves.SINE);
    //mod_lfo1 = new Oscil( _params.modfreq1  , 1, Waves.SINE);  //3つ目のアルゴリズム　フェーズジャンプ
    filter1  = new MoogFilter( 1200, 0.5 );
    bitCrush1 = new BitCrush( 4, out.sampleRate());

//  float[] sawVal= { -1.0, -0.9, 0.0,  0.9, 1.0};   //soft distotion 
//  float[] sawVal= { -1.0, -1.0, 0.0,  1.0, 1.0};   //distotion A
//  float[] sawVal= { -1.0, -1.0, -1.0, 0.0, 1.0, 1.0, 1.0};   //distotion B
    float[] sawVal= { -1.0, -1.0, -1.0, -1.0, 0.0, 1.0, 1.0, 1.0, 1.0};   //distotion C
//    float[] sawVal= {-0.4,-1.0, 0.0 , 1.0, 0.4};     //fold
    Wavetable wavetable =  new Wavetable(sawVal);
    distotion = new WaveShaper(1.0, 1.0, wavetable  );   
    multiplier = new Multiplier(_params.amp1);
         
    const1.patch(sum1);
//  const2.patch(mod_lfo1).patch(sum1);
    const2.patch(mod_adsr1).patch(sum1);
    sum1.patch(cv2hz);

    //delay = new Delay( 0.4, 0.5, true, true );    
    
   switch(Waveform1){
     case 0:
         osc1 = new Oscil( 1 ,1, Waves.SINE );
         cv2hz.patch( osc1.frequency);
         osc1.patch(distotion).patch(multiplier).patch(amp_adsr1);
     break;
     case 1:
         osc1 = new Oscil( 1, 1, Waves.TRIANGLE );
         cv2hz.patch( osc1.frequency);
         osc1.patch(distotion).patch(multiplier).patch(amp_adsr1);
     break;
     case 2:
         osc1 = new Oscil( 1, 1, Waves.SQUARE );
         cv2hz.patch( osc1.frequency);
         osc1.patch(distotion).patch(multiplier).patch(amp_adsr1);
     break;
     case 3:
         osc1 = new Oscil( 1, 1, Waves.SAW );
         cv2hz.patch( osc1.frequency);
         osc1.patch(distotion).patch(multiplier).patch(amp_adsr1);
     break;     
     case 4:
         osc1 = new Oscil( 1, 1, Waves.PHASOR );
         cv2hz.patch( osc1.frequency);
         osc1.patch(distotion).patch(multiplier).patch(amp_adsr1);
     break;     
     case 5:
         noise1 = new Noise(_params.amp1);
         filter1 = new MoogFilter( _params.freq1, 0.5, MoogFilter.Type.LP );
         noise1.patch( filter1).patch( amp_adsr1 );
         cv2hz.patch( filter1.frequency);
     break;
     case 6:
         noise1 = new Noise(_params.amp1);
         filter1 = new MoogFilter( _params.freq1, 0.5, MoogFilter.Type.BP );
         noise1.patch( filter1).patch( amp_adsr1 );
         cv2hz.patch( filter1.frequency);
     break;
     case 7:
         noise1 = new Noise(_params.amp1);
         filter1 = new MoogFilter( _params.freq1, 0.5, MoogFilter.Type.HP );
         noise1.patch( filter1).patch( amp_adsr1 );
         cv2hz.patch( filter1.frequency);
     break;
   }
}

  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    // turn on the ADSR
    amp_adsr1.noteOn();
    mod_adsr1.noteOn();
    // patch to the output
    amp_adsr1.patch( out );
   // amp_adsr1.patch(distotion).patch( out );
  }

  // every instrument must have a noteOff() method
  void noteOff(){
//    amp_adsr0.unpatchAfterRelease( out );
    amp_adsr1.unpatchAfterRelease( out );
    mod_adsr1.unpatchAfterRelease( out );
//    amp_adsr0.noteOff();
    amp_adsr1.noteOff();
    mod_adsr1.noteOff();
  }
}
