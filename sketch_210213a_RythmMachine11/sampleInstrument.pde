class SampleInstrument implements Instrument
{
  Sampler sound1;
  // constructor for this instrument
  SampleInstrument(Sampler _sound)
  {    
    sound1 = _sound;
  }

  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    sound1.trigger();
  }

  // every instrument must have a noteOff() method
  void noteOff()
   
  {

  }
}
