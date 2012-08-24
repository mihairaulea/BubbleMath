package model 
{

	
	public class CalcElement 
	{
		// 0 - numar
		// 1 - operator
		var type:int = 0;
		var value:String = "";
		
		public function CalcElement(type:int=0, value:String="")
		{
			this.type = type;
			this.value = value;
		}
		
	}

}