package view 
{
	
	import flash.display.*;
	import flash.events.*;
	
	public class BubbleOperator extends Sprite
	{	
		public var type:String = "";
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
					type = "+";
					break;
				case "-":
					var operatorSubstract:operatorSubstractMC = new OperatorSubstractMC();
					operator = operatorSubstract;
					type = "-";
					break;
				case "*":
					var operatorMultiply:operatorMultiplyMC = new OperatorMultiplyMC();
					operator = operatorMultiply;
					type = "*";
					break;
				case "/":
					var operatorDivide:operatorDivideMC = new OperatorDivideMC();
					operator = operatorDivide;
					type = "/";
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