package
{

	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.ui.Mouse;
	import flash.media.SoundChannel;
	
	public class AvoiderGame extends MovieClip 
	{
		public var foe:Foe;
		public var me:Me;
		public var army:Array;
		public var gameTimer:Timer;
		public var gameScore:Score = new Score();
		public var backgroundMusic:BackGroundMusic;
	public var bgmSoundChannel:SoundChannel;
		
 
		public function AvoiderGame() 
		{
			backgroundMusic = new BackGroundMusic();
			bgmSoundChannel = backgroundMusic.play();
			Mouse.hide();
			foe = new Foe(0,0);
			addChild( foe );
			army = new Array();
			var newfoe = new Foe(0,0);
			army.push( newfoe );
			addChild( newfoe );
 
			me = new Me();
			addChild( me );
			me.x = mouseX;
			me.y = mouseY;
 
			gameTimer = new Timer( 25 );
			gameTimer.addEventListener( TimerEvent.TIMER, onTick );
			gameTimer.start();
		}
 
		public function onTick( timerEvent:TimerEvent ):void 
		{
			if (Math.random()<0.1)
			{
			var randomX:Number = Math.random() * 400;
			
			var newFoe:Foe = new Foe(randomX,0);
			army.push( newFoe );
			addChild( newFoe );
			gameScore.addToValue( 10 );
			}
			for each ( var foe:Foe in army ) 
			{
				foe.Foemoves();
				if ( PixelPerfectCollisionDetection.isColliding( me, foe, this, true ) )

			{
 				gameTimer.stop();
				dispatchEvent( new MyEvent( MyEvent.DEAD ) );
			}
			}
			me.x = mouseX;
			me.y = mouseY;
 
			
		}
	}
}