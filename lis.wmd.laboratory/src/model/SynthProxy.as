package model 
{
	import flash.utils.setTimeout;
	import org.mvcexpress.mvc.Proxy;
	import test.effects.Delay;
	import test.poly.SimplePolySynthVoiceFactory;
	import tonfall.core.blockSize;
	import tonfall.core.Driver;
	import tonfall.core.Engine;
	import tonfall.core.Memory;
	import tonfall.core.TimeConversion;
	import tonfall.core.TimeEventNote;
	import tonfall.prefab.poly.PolySynth;
	
	/**
	 * ...
	 * @author Marek Lis
	 */
	public class SynthProxy extends Proxy 
	{
		
		public static const NOTES : Vector.<int> = Vector.<int>( [
			48, 50, 52, 53, 55, 57, 59,
			60, 62, 64, 65, 67, 69, 71, 
			72, 74, 76, 77, 79, 81, 83,
			84, 86, 88, 89, 91, 93, 95,
			96
		] );
		//public static const NOTES : Vector.<int> = Vector.<int>( [96,93,91,89,86,84,81,79,77,74,72,69,67,65,62,60] );
		//public static const NOTES : Vector.<int> = Vector.<int>( [96,95,94,93,92,91,90,89,88,87,86,85,84,83,82,81,80,79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,50] );
		
		protected const driver:Driver = Driver.getInstance();
		protected const engine:Engine = Engine.getInstance();
		protected const generator:PolySynth = new PolySynth(SimplePolySynthVoiceFactory.INSTANCE);
		protected const delay:Delay = new Delay(TimeConversion.barsToMillis(3.0 / 16.0, Engine.getInstance().bpm));
		
		public function SynthProxy() 
		{
			Memory.length = blockSize << 3;
			driver.engine = engine;
			setTimeout( driver.init, 100 );
			
			delay.wet = 0.25;
			delay.dry = 0.25;

			engine.processors.push( generator );
			engine.processors.push( delay );
			
			delay.signalInput = generator.signalOutput;
			engine.input = delay.signalOutput;

		}
		
		public function playNote(ratio:Number, volume:Number = 0.25):void {
			//delay.wet = delay.dry = volume;
			var val:int = NOTES[Math.floor((1-ratio) * (NOTES.length - 1))];
			var tin:TimeEventNote = new TimeEventNote();
			tin.note = val;
			tin.barDuration = 4.0 / 16.0;
			generator.addTimeEvent(tin);
		}
		
	}

}