class ToneInstrument implements Instrument
{
  // create all variables that must be used througout the class
  Oscil osc1, osc2;
  Noise noise1,noise2;
  ADSR  adsr2, adsr1;
  MoogFilter mfilter1,mfilter2;
  //Delay delay;
  Oscil lfo1;
  Constant const1;
  Summer sum1;
  GranulateRandom gnr;
 Damp damp;
  
  // constructor for this instrument
  ToneInstrument( Params _params)
  {    
//    adsr1 = new ADSR( 1, _params.a1, _params.d1, _params.s1, _params.r1 );
      damp = new Damp( _params.a1, _params.d1);
//    adsr1 = new ADSR( 1, _params.a1, _params.d1, 0.0 ,  _params.d1);
//    adsr1 = new ADSR( 1, 0.01, 1.0, 0.5, 0.2 );
 //   adsr2 = new ADSR( 1, _params.a2, _params.d2, _params.s2, _params.r2 );
    //delay = new Delay( 0.4, 0.5, true, true );
    lfo1 = new Oscil( _params.modfreq1, _params.modamp1/4, Waves.SINE);
    //const1 = new Constant( _params.freq1 );
    //sum1 = new Summer();
    //lfo1.patch(sum1);
    //const1.patch(sum1);
    
   switch(Waveform1){
     case 0:
         osc1 = new Oscil( _params.freq1 , _params.amp1, Waves.SINE );
         //osc1.patch( adsr1 );
         osc1.patch( damp );
         //sum1.patch(osc1.frequency);
         lfo1.patch(osc1.phase);
     break;
     case 1:
         osc1 = new Oscil( _params.freq1, _params.amp1, Waves.TRIANGLE );
         osc1.patch( adsr1 );
         break;
     case 2:
         osc1 = new Oscil( _params.freq1, _params.amp1, Waves.SQUARE );
         osc1.patch( adsr1 );
     break;
     case 3:
         osc1 = new Oscil( _params.freq1, _params.amp1, Waves.SAW );
         osc1.patch( adsr1 );
     break;     
     case 4:
         noise1 = new Noise(_params.amp1);
         mfilter1 = new MoogFilter( _params.freq1, 0.5, MoogFilter.Type.LP );
         noise1.patch(mfilter1).patch( adsr1 );
     break;
     case 5:
         noise1 = new Noise(_params.amp1);
         mfilter1 = new MoogFilter( _params.freq1, 0.5, MoogFilter.Type.BP );
         noise1.patch(mfilter1).patch( adsr1 );
     break;
     case 6:
         noise1 = new Noise(_params.amp1);
         mfilter1 = new MoogFilter( _params.freq1, 0.5, MoogFilter.Type.HP );
         noise1.patch(mfilter1).patch( adsr1 );
     break;
   }

   //switch(Waveform2){
   //  case 0:
   //      osc2 = new Oscil( _params.freq2, _params.amp2, Waves.SINE );
   //      osc2.patch( adsr2 );
   //  break;
   //  case 1:
   //      osc2 = new Oscil( _params.freq2, _params.amp1, Waves.TRIANGLE );
   //      osc2.patch( adsr2 );
   //  break;
   //  case 2:
   //      osc2 = new Oscil( _params.freq2, _params.amp2, Waves.SQUARE );
   //      osc2.patch( adsr2 );
   //  break;
   //  case 3:
   //      osc2 = new Oscil( _params.freq2, _params.amp2, Waves.SAW );
   //      osc2.patch( adsr2 );
   //  break;     
   //  case 4:
   //      noise2 = new Noise(_params.amp2);
   //      mfilter2 = new MoogFilter( _params.freq2, 0.5, MoogFilter.Type.LP );
   //      noise2.patch(mfilter2).patch( adsr2 );
   //  break;
   //  case 5:
   //      noise2 = new Noise(_params.amp2);
   //      mfilter2 = new MoogFilter( _params.freq2, 0.5, MoogFilter.Type.BP );
   //      noise2.patch(mfilter2).patch( adsr2 );
   //  break;
   //  case 6:
   //      noise2 = new Noise(_params.amp2);
   //      mfilter2 = new MoogFilter( _params.freq2, 0.5, MoogFilter.Type.HP );
   //      noise2.patch(mfilter2).patch( adsr2 );
   //}    
}

  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    // turn on the ADSR
      damp.activate();
      damp.patch(out);
//    adsr1.noteOn();
//    adsr2.noteOn();
    // patch to the output
//    adsr1.patch( out );
//    adsr2.patch( out );
  }

  // every instrument must have a noteOff() method
  void noteOff()
  {
        damp.unpatchAfterDamp( out );
    // tell the ADSR to unpatch after the release is finished
//    adsr1.unpatchAfterRelease( out );
//    adsr2.unpatchAfterRelease( out );
    // call the noteOff 
    //adsr1.noteOff();
//    adsr2.noteOff();
  }
}