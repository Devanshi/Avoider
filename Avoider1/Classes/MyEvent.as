package  
{
	import flash.events.Event;
	public class MyEvent extends Event 
	{
		public static const DEAD:String = "dead";
 
		public function MyEvent( type:String )
		{
 				super( type );
		}
	}
}