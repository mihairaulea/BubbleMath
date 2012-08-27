package 
{
	
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.text.engine.TextBlock;
	import view.*;
	
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
			loaderInfo.addEventListener(Event.COMPLETE, onCompleteInfo);
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
			modelInst.addEventListener(Model.NEW_PIECE, newPieceHandler);
			//modelInst.addEventListener(Model.UPDATE_EQUATION, updateEquationHandler);
			modelInst.init();
		}
		
		//{ region Model event handlers
		
		private function newGameHandler(e:Event)
		{
			viewInst.newGame(modelInst.getNewObjective(), modelInst.noOfLives);
			modelInst.startPieces();
		}
		
		private function newPieceHandler(e:Event)
		{
			var calcElem:CalcElement = modelInst.getRandomElement();
			
			if (calcElem.type == 0)
				viewInst.addBubbleNumber(int(calcElem.value), calcElem.pos);
			else
				viewInst.addBubbleOperator(calcElem.value, calcElem.pos);
		}
		
		//private function updateEquationHandler(e:Event)
		//{
		//	viewInst.updateEquation();
		//}
		
		private function bustHandler(e:Event)
		{
			viewInst.bust(modelInst.noOfBusts++);
		}
		
		private function greatHandler(e:Event)
		{
			viewInst.great();
		}
		
		
		//} end region 
		
		private function setView()
		{
			// THE ONLY ADD CHILD IN THIS CLASS!!!
			viewInst.addEventListener(BubblePool.BUBBLE_CLICKED, bubbleClickedHandler);
			viewInst.init();
			addChild(viewInst);
		}
		
		//view event handlers
		
		private function bubbleClickedHandler(e:Event)
		{
			trace(e.currentTarget.value, e.currentTarget.type);
			var eq:String = modelInst.addToEquation(e.currentTarget.value, e.currentTarget.type);
			viewInst.updateEquation(eq);
		}
		
		// end view event handlers
	}
	
}