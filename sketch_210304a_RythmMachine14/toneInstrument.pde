class ToneInstrument implements Instrument
{
  // create all variables that must be used througout the class
  Oscil osc1;
  Noise noise1;
  ADSR  adsr1;
  MoogFilter mfilter1;
  Oscil lfo1;
  Constant const1;
  Summer sum1;
  Midi2Hz midi2hz1;
  BitCrush bitcrush1;
  WaveShaper overdrive1;
  WaveShaper fold1;

  // constructor for this instrument
  ToneInstrument( Params _params)
  {    
    //    adsr1 = new ADSR( _params.amp1, _params.a1, _params.d1, 0.0 , _params.d1);
    adsr1 = new ADSR( _params.amp1, _params.a1, 0.0, 1.0, _params.d1);
    //    adsr1 = new ADSR( _params.amp1, 0.1, 0.0, 1.0 , _params.d1);

    sum1 = new Summer();
    midi2hz1 = new Midi2Hz(); 
    bitcrush1 = new BitCrush(_params.bitcrush1, out.sampleRate());
    overdrive1 = new WaveShaper( max(1, 0.5/_params.overdrive1), _params.overdrive1, 
      new Wavetable( new float[]{ -1.0, -1.0, -1.0, -1.0, 0.0, 1.0, 1.0, 1.0, 1.0}) );
    fold1      = new WaveShaper( max(1, 0.25/_params.fold1), _params.fold1, 
      new Wavetable( new float[]{ -1.0, 1.0, -1.0, -0.5, 0.0, 0.5, 1.0, -1.0, 1.0}) ); 

    switch(_params.modform1) 
    {
    case 1:
      lfo1 = new Oscil( pow(2, _params.modfreq1/12 - 4), _params.modamp1*5, Waves.SINE); 
      lfo1.setPhase(.5);   
      lfo1.patch(sum1);
      const1 = new Constant( log((_params.freq1 +1)*(_params.freq1 +1) + 200 )*17.31 -82.91622   );    
      const1.patch(sum1);
      break;
    case 2:
      lfo1 = new Oscil( pow(2, _params.modfreq1/12 - 4), _params.modamp1, Waves.SQUARE);  
      lfo1.setPhase(.5);
      lfo1.patch(sum1);     
      const1 = new Constant( log((_params.freq1 +1)*(_params.freq1 +1) + 200 )*17.31 -82.91622   );    
      const1.patch(sum1);
      break;
    case 3:
      lfo1 = new Oscil( pow(2, _params.modfreq1/12 - 4), _params.modamp1, Waves.SAW);   
      lfo1.setPhase(.5);   
      lfo1.patch(sum1);   
      const1 = new Constant( log((_params.freq1 +1)*(_params.freq1 +1) + 200 )*17.31 -82.91622  );    
      const1.patch(sum1);
      break;
    }
    sum1.patch(midi2hz1);

    switch(_params.waveform1)
    {
    case 0:
      osc1 = new Oscil( _params.freq1, 1, Waves.SINE );         
      osc1.patch(overdrive1).patch(fold1).patch(bitcrush1).patch( adsr1 );
      midi2hz1.patch(osc1.frequency);
      break;
    case 1:
      osc1 = new Oscil( _params.freq1, 1, Waves.TRIANGLE );
      osc1.patch(overdrive1).patch(fold1).patch(bitcrush1).patch( adsr1 );
      midi2hz1.patch(osc1.frequency);
      break;
    case 2:
      osc1 = new Oscil( _params.freq1, 1, Waves.SQUARE );
      osc1.patch(overdrive1).patch(fold1).patch(bitcrush1).patch( adsr1 );
      midi2hz1.patch(osc1.frequency);
      break;
    case 3:
      osc1 = new Oscil( _params.freq1, 1, new Wavetable(new float[]{0, -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 0 }) );
      osc1.patch(overdrive1).patch(fold1).patch(bitcrush1).patch( adsr1 );
      midi2hz1.patch(osc1.frequency);
      break;     
    case 4:
      noise1 = new Noise(_params.amp1);
      mfilter1 = new MoogFilter( _params.freq1, 1, MoogFilter.Type.LP );
      noise1.patch(overdrive1).patch(fold1).patch(bitcrush1).patch(mfilter1).patch( adsr1 );
      midi2hz1.patch(mfilter1.frequency);
      //noise1.setTint(Noise.Tint.RED);
      //noise1.patch(adsr1);
      break;
    case 5:
      noise1 = new Noise(_params.amp1);
      mfilter1 = new MoogFilter( _params.freq1, 1, MoogFilter.Type.HP );
      noise1.patch(overdrive1).patch(fold1).patch(bitcrush1).patch(mfilter1).patch( adsr1 );
      midi2hz1.patch(mfilter1.frequency);         
      //noise1.setTint(Noise.Tint.PINK);
      //noise1.patch(adsr1);
      break;
    case 6:
      noise1 = new Noise(_params.amp1);
      mfilter1 = new MoogFilter( _params.freq1, 1, MoogFilter.Type.BP );
      noise1.patch(overdrive1).patch(fold1).patch(bitcrush1).patch(mfilter1).patch( adsr1 );
      midi2hz1.patch(mfilter1.frequency);         
      //noise1.setTint(Noise.Tint.BROWN);
      //noise1.patch(adsr1);
      break;
    }
  }
    // every instrument must have a noteOn( float ) method
    void noteOn(float dur)
    {
      // turn on the ADSR
      adsr1.noteOn();
      // patch to the output
      adsr1.patch(out);
    }

    // every instrument must have a noteOff() method
    void noteOff()
    {
      // tell the ADSR to unpatch after the release is finished
      adsr1.unpatchAfterRelease(out);
      // call the noteOff 
      adsr1.noteOff();
    }
  }
