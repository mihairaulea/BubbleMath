package model 
{

	
	public class CalcElement 
	{
		// 0 - numar
		// 1 - operator
		public var type:int = 0;
		public var value:String = "";
		public var pos:int = 0;
		
		public function CalcElement(type:int=0, value:String="", pos:int =0)
		{
			this.type = type;
			this.value = value;
			this.pos = pos;
		}
		
	}

}