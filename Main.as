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
	import util.GlobalVariables;
	
	public class Main extends MovieClip {
		
		var modelInst:Model = new Model();
		var viewInst:View = new View();
		
		public function Main()
		{
<<<<<<< HEAD
			loaderInfo.addEventListener(Event.COMPLETE, onCompleteInfo);
=======
			setModel();
			setView();
			trace("this is another modif");
			trace("this is yet another modif");
			////
			trace("this is the latest bitch");
>>>>>>> 5e3b7ab83684b07948d24492d715b47bd25d98ab
		}		
		
		private function onCompleteInfo(e:Event):void
		{	
			stage.addEventListener(Event.RESIZE, resizeHandler);
			
			GlobalVariables.SCENE_HEIGHT = loaderInfo.height;
			GlobalVariables.SCENE_WIDTH = loaderInfo.width;
			
			setView();
			setModel();
		}
		
		private function resizeHandler(e:Event)
		{
			GlobalVariables.SCENE_HEIGHT = stage.stageHeight;
			GlobalVariables.SCENE_WIDTH = stage.stageWidth;
		}
		
		private function setModel()
		{
			modelInst.addEventListener(Model.BUST, bustHandler);
			modelInst.addEventListener(Model.GREAT, greatHandler);
			modelInst.addEventListener(Model.NEW_GAME, newGameHandler);
			modelInst.addEventListener(Model.UPDATE_EQUATION, updateEquationHandler);
			modelInst.init();
		}
		
		// model event handlers
		private function newGameHandler(e:Event)
		{
			viewInst.newGame(modelInst.getNewObjective(), modelInst.noOfLives);
			//viewInst.addBubbleOperator("-", 0);
		}
		
		private function updateEquationHandler(e:Event)
		{
			var char:String = "1+5*7/9-3";
			viewInst.updateEquation(char);
		}
		
		private function bustHandler(e:Event)
		{
			viewInst.bust(modelInst.noOfBusts++);
		}
		
		private function greatHandler(e:Event)
		{
			viewInst.great();
		}
		
		
		// end model event handlers
		
		private function setView()
		{
			// THE ONLY ADD CHILD IN THIS CLASS!!!
			viewInst.init();
			addChild(viewInst);
		}
		
		//view event handlers
		
		
		// end view event handlers
	}
	
}