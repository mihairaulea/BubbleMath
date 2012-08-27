package view 
{
	
	import flash.display.*;
	import flash.events.*;
	
	public class BubbleOperator extends Sprite
	{	
		public var type:int = 1;
		public var value:String = "";
		public var operator:DisplayObject;
		
		public function BubbleOperator() 
		{
			
		}
		
		public function initBubbleOperator(op:String)
		{
			switch(op)
			{
				case "+":
					var operatorPlus:operatorPlusMC = new OperatorPlusMC();
					operator = operatorPlus;
					value = "+";
					break;
				case "-":
					var operatorSubstract:operatorSubstractMC = new OperatorSubstractMC();
					operator = operatorSubstract;
					value = "-";
					break;
				case "*":
					var operatorMultiply:operatorMultiplyMC = new OperatorMultiplyMC();
					operator = operatorMultiply;
					value = "*";
					break;
				case "/":
					var operatorDivide:operatorDivideMC = new OperatorDivideMC();
					operator = operatorDivide;
					value = "/";
					break;
			}
			
			addChild(operator);
		}
		
		public function resetBubbleOperator()
		{
			removeChild(operator);
			operator = null;
		}
	}

}