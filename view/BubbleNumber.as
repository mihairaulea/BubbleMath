package view 
{
	
	import flash.display.*;
	import flash.events.*;
	
	public class BubbleNumber extends Sprite
	{
		private var numberArrayPos1:Array = new Array();
		private var numberZero1:ObjectiveZeroMC = new ObjectiveZeroMC();
		private var numberOne1:ObjectiveOneMC = new ObjectiveOneMC();
		private var numberTwo1:ObjectiveTwoMC = new ObjectiveTwoMC();
		private var numberThree1:ObjectiveThreeMC = new ObjectiveThreeMC();
		private var numberFour1:ObjectiveFourMC = new ObjectiveFourMC();
		private var numberFive1:ObjectiveFiveMC = new ObjectiveFiveMC();
		private var numberSix1:ObjectiveSixMC = new ObjectiveSixMC();
		private var numberSeven1:ObjectiveSevenMC = new ObjectiveSevenMC();
		private var numberEight1:ObjectiveEightMC = new ObjectiveEightMC();
		private var numberNine1:ObjectiveNineMC = new ObjectiveNineMC();
		
		private var numberArrayPos2:Array = new Array();		
		private var numberZero2:ObjectiveZeroMC = new ObjectiveZeroMC();
		private var numberOne2:ObjectiveOneMC = new ObjectiveOneMC();
		private var numberTwo2:ObjectiveTwoMC = new ObjectiveTwoMC();
		private var numberThree2:ObjectiveThreeMC = new ObjectiveThreeMC();
		private var numberFour2:ObjectiveFourMC = new ObjectiveFourMC();
		private var numberFive2:ObjectiveFiveMC = new ObjectiveFiveMC();
		private var numberSix2:ObjectiveSixMC = new ObjectiveSixMC();
		private var numberSeven2:ObjectiveSevenMC = new ObjectiveSevenMC();
		private var numberEight2:ObjectiveEightMC = new ObjectiveEightMC();
		private var numberNine2:ObjectiveNineMC = new ObjectiveNineMC();		
		
		public var number:int = 0;
		public var visualBubble:BubbleMC = new BubbleMC();
		
		public var visualNumber1:DisplayObject;
		public var visualNumber2:DisplayObject;
		
		public function BubbleNumber() 
		{
			
		}
		
		public function initBubbleNumber(nr:int)
		{
			addChild(visualBubble);
			
			if (nr < 10)
			{
				
			}
			else
			{
				
			}
		}
	}

}