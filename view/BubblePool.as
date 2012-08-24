package view 
{
	
	import flash.display.*;
	import flash.events.*;
	import com.greensock.*;
	
	public class BubblePool extends Sprite
	{
		
		private var availableOperatorsPool:Array = new Array();
		private var inGameOperatorsPool:Array = new Array();
		private var totalNoOfOperators:int = 40;
		
		private var availableNumbersPool:Array = new Array();
		private var inGameNumbersPool:Array = new Array();
		private var totalNoOfNumbers:int = 100;
		
		// should be a function of velocity, and screen size
		private var timeToGoThroughStage:int = 20;
		
		public function BubblePool() 
		{
			
		}
		
		public function init()
		{
			
			for (var i:int = 0; i < totalNoOfOperators; i++)
			{
				availableOperatorsPool[i] = new BubbleOperator();
			}
			
			for (var j:int = 0; j < totalNoOfNumbers; j++)
			{
				availableOperatorsPool[i] = new BubbleNumber();
			}
			
		}
		
		// should be in different class maybe?		
		public function spawnNewNumberBubble(bubbleNumber:int)
		{
			var bubbleToUse:BubbleNumber = availableNumbersPool[availableOperatorsPool.length - 1];
			availableNumbersPool.splice(availableNumbersPool.length - 1, 1);
			inGameNumbersPool.push(bubbleToUse);
			
			bubbleToUse.y = -bubbleToUse.height;
			
			animateBubble(bubbleToUse);
		}
		
		private function animateNumberBubble( bubble:BubbleNumber )
		{
			TweenMax.to( bubble, timeToGoThroughStage, { y : stage.stageHeight, onComplete: bubbleAnimationComplete } );
		}
		
		// bubble reached end 
		private function bubbleAnimationComplete()
		{
			trace("bubble reached bottom of stage");
		}
		
	}

}