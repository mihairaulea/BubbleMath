package view 
{
	
	import flash.display.*;
	import flash.events.*;
	
	import util.GlobalVariables;
	
	public class View extends Sprite 
	{
		// should function and scale according to stage width and height
		
		var sceneWidth = 0;
		var sceneHeight = 0;
		
		var background:Background = new Background();
		var display:Interface = new Interface();
		
		var bubblePool:BubblePool = new BubblePool();
		
		public function View() 
		{
			
		}
		
		public function init()
		{
			sceneWidth = GlobalVariables.SCENE_WIDTH;
			sceneHeight = GlobalVariables.SCENE_HEIGHT;
		
			background.init(sceneWidth, sceneHeight);
			addChild(background);
		
			display.objectiveX = sceneWidth - 70;
			display.objectiveY = 15;
			display.notifX = sceneWidth / 2;
			display.notifY = sceneHeight / 2;
			display.init();
			addChild(display);
			
			bubblePool.init();
			bubblePool.maxPos = GlobalVariables.SCENE_WIDTH;
			addChild(bubblePool);
		}
		
		public function newGame(obj:int,noOfLives:int)
		{
			display.setObjective(obj);
			display.setLives(noOfLives);
		}
		
		public function bust(noOfBusts)
		{
			display.showBust(noOfBusts);
		}
		
		public function great()
		{
			display.showGreat();
		}
		
		public function setObjective(obj:int)
		{
			display.setObjective(obj);
		}
		
		public function updateEquation(char:String)
		{
			display.addToEquation(char);
		}
		
		public function addBubbleOperator(op:String, pos:int)
		{
			bubblePool.spawnNewOperatorBubble(op, pos);
		}
		
		public function addBubbleNumber(nr:int, pos:int)
		{
			bubblePool.spawnNewNumberBubble(nr, pos);
		}
		
		//public function resizeView()
	}

}