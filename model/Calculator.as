package model 
{
	import com.greensock.easing.Linear;
	import de.polygonal.ds.Iterator;
	import de.polygonal.ds.LinkedQueue;
	import de.polygonal.ds.LinkedStack;
	import flash.events.*;
	
	public class Calculator extends EventDispatcher
	{
		var fullEquation:String = "";
		var currentValue:int = 0;
		
		var elementsInEquationArray:Array = new Array();
		
		var obj = 1;
		var modifier:CalcElement = new CalcElement(1, "+");
		
		private const PLUS:String = "+";
		private const MINUS:String = "-";
		private const MULTIPLY:String = "*";
		private const DIVIDE:String = "/";
		
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
								fullEquation = fullEquation + elem.value;
								currentValue = int(parseEquation(fullEquation));
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
								fullEquation += elem.value;
								currentValue = int(parseEquation(fullEquation));
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
								fullEquation += elem.value;
								currentValue = int(parseEquation(fullEquation));
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
								fullEquation += elem.value;
								currentValue = int(parseEquation(fullEquation));
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
		
		private function parseEquation(expression:String):String
		{
			var postfix:LinkedQueue = toPostfix ( expression);
			return evaluate(postfix);
		}
		
		private function toPostfix ( infix:String):LinkedQueue
		{
			var output:LinkedQueue = new LinkedQueue();
			var operators:LinkedStack = new LinkedStack();
			
			var buffer:String = "";
			
			for ( var i:Number=0; i<infix.length; i++ )
			{
				var token:String = infix.charAt( i );
				
				if ( isOperand( token ) )
				{
					buffer += token;
					
					if ( !isOperand( infix.charAt( i+1 ) ) ) 
					{
						output.enqueue( buffer );
						buffer = "";
					}
				}
				else if ( isOperator( token ) )
				{	
					while ( getPrecedence( token ) <= getPrecedence( operators.peek() ) )
					{	
						output.enqueue( operators.pop() );
					}
					
					operators.push( token );
				}
				else
				{
					//throw new ArgumentError( "Bad Input" );
					//reset();
					//dispatchEvent(new Event(Model.BUST));
				}
			}
			
			while ( !operators.isEmpty() )
			{
				output.enqueue( operators.pop() );
			}
			
			return output;
			
		}
		
		private function evaluate( postfix:LinkedQueue ):String
		{
			var items:Iterator = postfix.getIterator();
			
			var stack:LinkedStack = new LinkedStack();
			
			while ( items.hasNext() )
			{
				var token:String = items.next();
				
				if ( isOperand( token ) )
				{
					stack.push( token );
				}
				else if ( isOperator( token ) )
				{
					var operand2:Number = parseFloat( stack.pop() );
					var operand1:Number = parseFloat( stack.pop() );
					
					stack.push( doOperation( token, operand1, operand2 ) );
				}
			}
			
			return stack.pop();
		}

		private function getPrecedence( operator:String ):int
		{
			if ( operator == PLUS || operator == MINUS )
				return 1;
			else if ( operator == MULTIPLY || operator == DIVIDE )
				return 2;
			
			return -1;
		}

		private function isOperand( token:String ):Boolean
		{
			return token.search( /\d+/ ) != -1;
		}
		
		private function isOperator( token:String ):Boolean
		{
			return token.search( /\+|\-|\/|\*/ ) != -1;
		}
		
		private function doOperation( operator:String, operand1:Number, operand2:Number ):Number
		{
			switch ( operator )
			{
				case PLUS:
					return operand1 + operand2;
				case MINUS:
					return operand1 - operand2;
				case MULTIPLY:
					return operand1 * operand2;
				case DIVIDE:
					return operand1 / operand2;
			}
			
			return 0;
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