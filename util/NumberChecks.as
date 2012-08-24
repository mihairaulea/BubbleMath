package util 
{
	public class NumberChecks 
	{
		
		public function NumberChecks() 
		{
			
		}
		
		public static function isPrime(n:int):Boolean
		{
			var k:uint = 2;
			while (k <= Math.sqrt(n))
			{
				if ( n % k == 0)
					return false;
				k++;
			}
			
			return true;
		}
		
	}

}