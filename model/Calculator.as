package model 
{
	import flash.events.*;
	
	public class Calculator extends EventDispatcher
	{
		var fullEquation:String = "";
		var currentValue:int = 0;
		
		var elementsInEquationArray:Array = new Array();
		
		var obj = 1;
		var modifier:CalcElement = new CalcElement(1, "+");
		
		//public static var BUST:String = "bust";
		//public static var WIN:String = "win";
		
		public function Calculator() 
		{

		}
		
		public function addElement(elem:CalcElement)
		{
			elementsInEquationArray.push( elem );
			
			if ( !checkIfEquationIsSane() ) 
			{
				reset();
				dispatchEvent(new Event(Model.BUST));
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
								fullEquation = fullEquation + elem.value;
								if (currentValue > obj || currentValue < 0)
								{
									reset();
									dispatchEvent(new Event(Model.BUST));
									break;
								}
								modifier.value = elem.value;
								modifier.type = 0;
								didGreat();
								break;
							case "*":
								currentValue *= int(elem.value);
								fullEquation += elem.value;
								if (currentValue > obj || currentValue < 0)
								{
									reset();
									dispatchEvent(new Event(Model.BUST));
									break;
								}
								modifier.value = elem.value;
								modifier.type = 0;
								didGreat();
								break;
							case "-":
								currentValue -= int(elem.value);
								fullEquation += elem.value;								
								if (currentValue > obj || currentValue < 0)
								{
									reset();
									dispatchEvent(new Event(Model.BUST));
									break;
								}
								modifier.value = elem.value;
								modifier.type = 0;
								didGreat();
								break;
							case "/":
								currentValue /= int(elem.value);
								fullEquation += elem.value;
								if (currentValue > obj || currentValue < 0 || (currentValue % int(elem.value) != 0))
								{
									reset();
									dispatchEvent(new Event(Model.BUST));
									break;
								}
								modifier.value = elem.value;
								modifier.type = 0;
								didGreat();
								break;
						}						
					}
					else
					{
						reset();
						dispatchEvent(new Event(Model.BUST));
					}
				}
				else 
				{
					if (modifier.type == 0)
					{
						fullEquation += elem.value;
						modifier.value = elem.value;
						modifier.type = 1;
					}
					else
					{
						reset();
						dispatchEvent(new Event(Model.BUST));
					}
				}
				
			}
		}
		
		private function checkIfEquationIsSane():Boolean
		{
			if (elementsInEquationArray.length > 11)
				return false;
				
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
		
		//public function getCurrentValue(): int
		//{
		//	return this.currentValue;
		//}
		
		private function didGreat()
		{
			if (currentValue == obj)
			{
				reset();
				dispatchEvent(new Event(Model.GREAT));
			}
		}
	}

}