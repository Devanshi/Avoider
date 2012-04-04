package
{
	import flash.display.MovieClip;
	public class Counter extends MovieClip
	{
		public var currentValue:Number;
 
		public function Counter()
		{
 			reset();
		}
 
		public function addToValue( amountToAdd:Number ):void
		{
 			 currentValue = currentValue + amountToAdd;
			 updateDisplay();

		}
 
		public function reset():void
		{
 				currentValue = 0;
			    
				updateDisplay();


		}
 
		public function updateDisplay():void
		{
 
		}
	}
}