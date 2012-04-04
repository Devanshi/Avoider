package 
{
	import flash.display.MovieClip;
	public class Foe extends MovieClip 
	{
		public function Foe(startX:Number, startY:Number ) 
		{
			x = startX;
			y = startY;			
		}
 
		public function Foemoves():void 
		{
			y = y + 3;
		}
	}
}