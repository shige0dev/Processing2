class ToneInstrument implements Instrument
{
  // create all variables that must be used througout the class
  Oscil osc1, osc2;
  Noise noise1,noise2;
  ADSR  adsr2, adsr1;
  MoogFilter mfilter1,mfilter2;
  Oscil lfo1,lfo2;
  Constant const1,const2;
  Summer sum1,sum2;
  Midi2Hz midi2hz1,midi2hz2;
  
    //Delay delay;
  // constructor for this instrument
  ToneInstrument( Params _params)
  {    
    adsr1 = new ADSR( 0.5, _params.a1, _params.d1, 0.0 , _params.d1);
    adsr2 = new ADSR( 0.5, _params.a2, _params.d2, 0.0 , _params.d2 );
//   delay = new Delay( 0.4, 0.5, true, true );
    sum1 = new Summer();
    switch(_params.modform1){
     case 1:
      lfo1 = new Oscil( pow(2,_params.modfreq1/12 - 4), _params.modamp1*5, Waves.SINE); lfo1.setPhase(.5);   lfo1.patch(sum1);
      const1 = new Constant( log((_params.freq1 +1)*(_params.freq1 +1) + 200 )*17.31 -82.91622   );    const1.patch(sum1);
     break;
     case 2:
      lfo1 = new Oscil( pow(2,_params.modfreq1/12 - 4), _params.modamp1, Waves.SQUARE);  lfo1.setPhase(.5);lfo1.patch(sum1);     
      const1 = new Constant( log((_params.freq1 +1)*(_params.freq1 +1) + 200 )*17.31 -82.91622   );    const1.patch(sum1);
     break;
     case 3:
      lfo1 = new Oscil( pow(2,_params.modfreq1/12 - 4), _params.modamp1, Waves.SAW);   lfo1.setPhase(.5);   lfo1.patch(sum1);   
      const1 = new Constant( log((_params.freq1 +1)*(_params.freq1 +1) + 200 )*17.31 -82.91622  );    const1.patch(sum1);
     break;
    }
    midi2hz1 = new Midi2Hz();
    sum1.patch(midi2hz1);
    
    sum2 = new Summer();    
    switch(_params.modform2){
     case 1:
      lfo2   = new Oscil( pow(2,_params.modfreq2/12 - 4), _params.modamp2, Waves.SINE);  lfo2.setPhase(.5);   lfo2.patch(sum2);
      const2 = new Constant(  log((_params.freq2 +1)*(_params.freq2 +1) + 200 )*17.31 -82.91622 );    const2.patch(sum2);
     break;
     case 2:
      lfo2 = new Oscil( pow(2,_params.modfreq2/12 - 4), _params.modamp2, Waves.SQUARE);  lfo2.setPhase(.5);   lfo2.patch(sum2);     
      const2 = new Constant( log((_params.freq2 +1)*(_params.freq2 +1) + 200 )*17.31 -82.91622);    const2.patch(sum2);
     break;
     case 3:
      lfo2 = new Oscil( pow(2,_params.modfreq2/12 - 4), _params.modamp2, Waves.SAW);   lfo2.setPhase(.5);  lfo2.patch(sum2);   
      const2 = new Constant( log((_params.freq2 +1)*(_params.freq2 +1) + 200 )*17.31 -82.91622);    const2.patch(sum2);
     break;
    }    
    midi2hz2 = new Midi2Hz(); 
    sum2.patch(midi2hz2);
     
   switch(_params.waveform1){
     case 0:
         osc1 = new Oscil( _params.freq1 , _params.amp1, Waves.SINE );
         osc1.patch( adsr1 );
         midi2hz1.patch(osc1.frequency);
         //lfo1.patch(osc1.phase);
     break;
     case 1:
         osc1 = new Oscil( _params.freq1, _params.amp1, Waves.TRIANGLE );
         osc1.patch( adsr1 );
         midi2hz1.patch(osc1.frequency);
         break;
     case 2:
         osc1 = new Oscil( _params.freq1, _params.amp1, Waves.SQUARE );
         osc1.patch( adsr1 );
         midi2hz1.patch(osc1.frequency);
     break;
     case 3:
         osc1 = new Oscil( _params.freq1 , _params.amp1, Waves.SAW );
         osc1.patch( adsr1 );
         midi2hz1.patch(osc1.frequency);
     break;     
     case 4:
         noise1 = new Noise(_params.amp1);
         mfilter1 = new MoogFilter( _params.freq1, 0.5, MoogFilter.Type.LP );
         noise1.patch(mfilter1).patch( adsr1 );
         midi2hz1.patch(mfilter1.frequency);
         //noise1.setTint(Noise.Tint.RED);
         //noise1.patch(adsr1);
     break;
     case 5:
         noise1 = new Noise(_params.amp1);
         mfilter1 = new MoogFilter( _params.freq1, 0.5, MoogFilter.Type.HP );
         noise1.patch(mfilter1).patch( adsr1 );
         midi2hz1.patch(mfilter1.frequency);         
         //noise1.setTint(Noise.Tint.PINK);
         //noise1.patch(adsr1);
     break;
     case 6:
         noise1 = new Noise(_params.amp1);
         mfilter1 = new MoogFilter( _params.freq1, 0.5, MoogFilter.Type.BP );
         noise1.patch(mfilter1).patch( adsr1 );
         midi2hz1.patch(mfilter1.frequency);         
         //noise1.setTint(Noise.Tint.BROWN);
         //noise1.patch(adsr1);
     break;
   }

   switch(_params.waveform2){
     case 0:
         osc2 = new Oscil( _params.freq2, _params.amp2, Waves.SINE );
         osc2.patch( adsr2 );
         midi2hz2.patch(osc2.frequency);         
     break;
     case 1:
         osc2 = new Oscil( _params.freq2, _params.amp1, Waves.TRIANGLE );
         osc2.patch( adsr2 );
         midi2hz2.patch(osc2.frequency);
     break;
     case 2:
         osc2 = new Oscil( _params.freq2, _params.amp2, Waves.SQUARE );
         osc2.patch( adsr2 );
         midi2hz2.patch(osc2.frequency);
     break;
     case 3:
         osc2 = new Oscil( _params.freq2, _params.amp2, Waves.SAW );
         osc2.patch( adsr2 );
         midi2hz2.patch(osc2.frequency);    
     break;     
     case 4:
         noise2 = new Noise(_params.amp2);
         mfilter2 = new MoogFilter( _params.freq2, 0.5, MoogFilter.Type.LP );
         noise2.patch(mfilter2).patch( adsr2 );
         midi2hz2.patch(mfilter2.frequency);           
     break;
     case 5:
         noise2 = new Noise(_params.amp2);
         mfilter2 = new MoogFilter( _params.freq2, 0.5, MoogFilter.Type.HP );
         noise2.patch(mfilter2).patch( adsr2 );
         midi2hz2.patch(mfilter2.frequency);           
     break;
     case 6:
         noise2 = new Noise(_params.amp2);
         mfilter2 = new MoogFilter( _params.freq2, 0.5, MoogFilter.Type.BP );
         noise2.patch(mfilter2).patch( adsr2 );
         midi2hz2.patch(mfilter2.frequency);          
   }    
}

  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    // turn on the ADSR
    adsr1.noteOn();
    adsr2.noteOn();
    // patch to the output
    adsr1.patch( out );
    adsr2.patch( out );
  }

  // every instrument must have a noteOff() method
  void noteOff()
  {
    // tell the ADSR to unpatch after the release is finished
    adsr1.unpatchAfterRelease( out );
    adsr2.unpatchAfterRelease( out );
    // call the noteOff 
    adsr1.noteOff();
    adsr2.noteOff();
  }
}
