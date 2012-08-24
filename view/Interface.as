package view 
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;

	public class Interface extends MovieClip
	{
		var objectiveTextField:TextField = new TextField();  
		
		public function Interface() 
		{

		}
		
		public function init()
		{
			addChild(objectiveTextField);
			
			objectiveTextField.width = 100;
			objectiveTextField.x = 10;
			objectiveTextField.y = 10;
			
			objectiveTextField.selectable = false;
		}
		
		public function setObjective(obj:int)
		{
			objectiveTextField.text = obj.toString();
		}
	}

}