package 
{
	
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.text.engine.TextBlock;
	import view.View;
	
	//timer
	import flash.utils.Timer;
	import view.Interface;
	
	import model.*;
	
	public class Main extends MovieClip {
		
		var modelInst:Model = new Model();
		var viewInst:View = new View();
		
		public function Main()
		{
			setModel();
			setView();
		}		
		
		private function setModel()
		{
			modelInst.addEventListener(Model.BUST, bustHandler);
			modelInst.init();
		}
		
		// model event handlers
		private function bustHandler(e:Event)
		{
			trace("model event BUST caught in Main");
		}
		
		
		// end model event handlers
		
		private function setView()
		{
			// THE ONLY ADD CHILD IN THIS CLASS!!!
			addChild(view);
		}
		
		//view event handlers
		
	}
	
}