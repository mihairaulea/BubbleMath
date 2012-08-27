package model 
{
	import flash.events.*;
	
	public class Calculator extends EventDispatcher
	{
		var fullEquation:String = "";
		var currentValue:int = 0;
		
		var elementsInEquationArray:Array = new Array();
		
		var modifier:CalcElement = new CalcElement(1, "+");
		
		static public var SCORE_PENALTY:String = "scorePenalty"; 
		static public var SCORE_BONUS:String = "scoreBonus"; 
		static public var UPDATE_EQUATION:String = "updateEquation";
		
		public static var BUST:String = "bust";
		
		public function Calculator() 
		{

		}
		
		public function addElement(elem:CalcElement)
		{
			
			elementsInEquationArray.push( elem );
			
			if ( !checkIfEquationIsSane() ) 
			{
				reset();
				//dispatchEvent(new Event(Calculator.BUST));
				return;
			}
			else
			{	
				
				if (elem.type == 0)
				{
					if (modifier.type == 1)
					{
						switch(modifier.value)
						{
							case "+":
								currentValue += int(elem.value);
								fullEquation = fullEquation + " " + elem.value;
								break;
							case "*":
								currentValue *= int(elem.value);
								fullEquation += elem.value;
								break;
							case "-":
								currentValue -= int(elem.value);
								fullEquation += elem.value;
								break;
						}
					
						modifier.value = elem.value;
						modifier.type = 0;
					
						
						//dispatchEvent(new Event(Calculator.UPDATE_EQUATION));
					}
					else
					{
						//dispatchEvent(new Event(Calculator.BUST));
					}
				}
				else 
				{
					if (modifier.type == 0)
					{
						fullEquation += elem.value;
						modifier.value = elem.value;
						modifier.type = 1;
					
						//dispatchEvent(new Event(Calculator.UPDATE_EQUATION));
					}
					else
					{
						//dispatchEvent(new Event(Calculator.BUST));
					}
				}
				
			}
		}
		
		private function checkIfEquationIsSane():Boolean
		{
			return true;
		}
		
		private function reset()
		{
			elementsInEquationArray.splice(0, elementsInEquationArray.length);
			fullEquation = "";
			currentValue = 0;
			modifier = new CalcElement(1, "+");	
		}
		
		public function getEquation():String
		{
			return this.fullEquation;
		}
		
		public function getCurrentValue(): int
		{
			return this.currentValue;
		}
	}

}