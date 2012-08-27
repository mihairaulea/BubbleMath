package view 
{
	
	import flash.display.*;
	import flash.events.*;
	import com.greensock.*;
	
	public class BubblePool extends Sprite
	{
		
		private var availableOperatorsPool:Array = new Array();
		private var inGameOperatorsPool:Array = new Array();
		private var totalNoOfOperators:int = 20;
		
		private var availableNumbersPool:Array = new Array();
		private var inGameNumbersPool:Array = new Array();
		private var totalNoOfNumbers:int = 20;
		
		// should be a function of velocity, and screen size
		private var timeToGoThroughStage:int = 20;
		
		// stage width for scaling
		var maxPos:int = 0;
		
		// increases spacing between pieces horisontally | 1 unit is 1/4 of a piece
		private var spacing:int = 3;
		
		static public var BUBBLE_CLICKED:String = "bubbleClicked";
		
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
				availableNumbersPool.push(new BubbleNumber());
			}
		}
		
		// should be in different class maybe?		
		public function spawnNewNumberBubble(bubbleNumber:int, pos:int)
		{
			var bubbleToUse:BubbleNumber = availableNumbersPool[availableNumbersPool.length - 1];
			availableNumbersPool.splice(availableNumbersPool.length - 1, 1);
			bubbleToUse.initBubbleNumber(bubbleNumber);
			inGameNumbersPool.push(bubbleToUse);
			bubbleToUse.x = pos * spacing * (maxPos / bubbleToUse.width);
			bubbleToUse.y = -bubbleToUse.height;
			
			bubbleToUse.addEventListener(MouseEvent.CLICK, bubbleClickedHandler);
			
			addChild(bubbleToUse);
			animateNumberBubble(bubbleToUse);
		}
		
		private function animateNumberBubble( bubble:BubbleNumber )
		{
			var temp:Array = new Array();
			temp.push(bubble);
			
			TweenMax.to( bubble, timeToGoThroughStage, { y : stage.stageHeight, onComplete: bubbleNumberAnimationComplete, onCompleteParams: temp } );
		}
		
		public function spawnNewOperatorBubble(bubbleOp:String, pos:int)
		{
			var bubbleToUse:BubbleOperator = availableOperatorsPool[availableOperatorsPool.length -1];
			availableOperatorsPool.splice(availableOperatorsPool.length -1, 1);
			bubbleToUse.initBubbleOperator(bubbleOp);
			inGameOperatorsPool.push(bubbleToUse);
			bubbleToUse.x = pos *  spacing * (maxPos / bubbleToUse.width);
			bubbleToUse.y = -bubbleToUse.height;
			
			bubbleToUse.addEventListener(MouseEvent.CLICK, bubbleClickedHandler);
			
			addChild(bubbleToUse);			
			animateOperatorBubble(bubbleToUse);
		}
		
		private function animateOperatorBubble( bubble:BubbleOperator )
		{
			var temp:Array = new Array();
			temp.push(bubble);
			
			TweenMax.to( bubble, timeToGoThroughStage, { y : stage.stageHeight, onComplete: bubbleOperatorAnimationComplete, onCompleteParams: temp } );
		}
		
		// number reached end 
		private function bubbleNumberAnimationComplete(bubbleFinished:BubbleNumber)
		{
			inGameNumbersPool.splice(0, 1);
			
			removeChild(bubbleFinished);
			bubbleFinished.resetBubbleNumber();
			
			availableNumbersPool.push(bubbleFinished);
		}
		
		// operator reached end 
		private function bubbleOperatorAnimationComplete(bubbleFinished:BubbleOperator)
		{
			//remove bubble from inGameOperatorsPool / search for the current bubble if necessary
			inGameOperatorsPool.splice(0, 1);
			
			removeChild(bubbleFinished);
			bubbleFinished.resetBubbleOperator();
			
			//add bubble back to availableOperatorsPool
			availableOperatorsPool.push(bubbleFinished);
		}
		
		private function bubbleClickedHandler(e:MouseEvent)
		{
			trace(e.currentTarget.value);
			dispatchEvent(new Event(BubblePool.BUBBLE_CLICKED));
			//remove the piece / event / dissolve the piece
		}
	}

}