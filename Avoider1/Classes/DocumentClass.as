package 
{
	import flash.display.MovieClip;
    import flash.ui.Mouse;

	public class DocumentClass extends MovieClip 
  {
		public var menuScreen:MenuScreen;
		public var gameOverScreen:GameOverScreen;
 		public var playScreen:AvoiderGame;

		public function DocumentClass() 
		{
			menuScreen = new MenuScreen();
			menuScreen.addEventListener( NavigationEvent.START, onRequestStart );
			menuScreen.x = 280;
			menuScreen.y = 250;
			addChild( menuScreen );
			gameOverScreen.x=-360;
			gameOverScreen.y=-360;
			
		}
		public function onMyDeath( myEvent:MyEvent ):void
		{
			gameOverScreen = new GameOverScreen();
			gameOverScreen.addEventListener( NavigationEvent.RESTART, onRequestRestart );
			gameOverScreen.x = 280;
			gameOverScreen.y = 250;
			addChild( gameOverScreen );
            Mouse.show();
			playScreen = null;
		}
 
		public function restartGame():void
		{
			playScreen = new AvoiderGame();
			playScreen.addEventListener( MyEvent.DEAD, onMyDeath );
			playScreen.x = 0;
			playScreen.y = 0;
			gameOverScreen.x = -360;
			gameOverScreen.y = -360;
			
			
			addChild( playScreen );
 
			gameOverScreen = null;
		}
		public function onRequestRestart( navigationEvent:NavigationEvent ):void
		{
			restartGame();
			
			
		}
		public function onRequestStart( navigationEvent:NavigationEvent ):void
		{
			playScreen = new AvoiderGame();
			playScreen.addEventListener( MyEvent.DEAD, onMyDeath );
			playScreen.x = 0;
			playScreen.y = 0;
			menuScreen.x = -360;
			menuScreen.y = -360;
			
			addChild( playScreen );
 
			menuScreen = null;
		}
	}
	}
