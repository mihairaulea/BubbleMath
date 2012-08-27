package view 
{
	import flash.display.*;
	import flash.filters.GlowFilter;
	import flash.text.*;
	import flash.events.*;

	public class Interface extends Sprite
	{
		//Notifications
		var notifBust:NotifBustMC = new NotifBustMC();
		var notifGreat:NotifGreatMC = new NotifGreatMC();
		var notifX:int = 0;
		var notifY:int = 0;
		
		//Text general
		private var textSize:int = 35;
		
		//Objective text
		private var objText:TextField = new TextField();
		private var objTextFormat:TextFormat = new TextFormat();
		private var objTextFont:Font = new Marvin();
		private var outline:GlowFilter = new GlowFilter(0xFFFFFF, 1, 6, 6, 10, 1, false, false);
		
		var objectiveX:int = 0;
		var objectiveY:int = 0;
		
		//Equation text
		private var equationText:TextField = new TextField();
		private var eqTextFormat:TextFormat = new TextFormat();
		private var eqTextFont:Font = new Marvin();
		
		//Score
		private var scoreLifeArray:Array = new Array();
		private var scoreBustArray:Array = new Array();
		
		public function Interface() 
		{

		}
		
		public function init()
		{
			//{ region Objective display init
			
			objTextFormat = new TextFormat(objTextFont.fontName, textSize, 0x1370B6, false, false, false, null, null, "left");			
			
			objText.text = "";
			objText.defaultTextFormat = objTextFormat;
			objText.autoSize = TextFieldAutoSize.LEFT;
			objText.x = objectiveX;
			objText.y = objectiveY;
			objText.embedFonts = true;
			objText.antiAliasType = AntiAliasType.ADVANCED;
			objText.multiline = false;
			objText.selectable = false;
			objText.filters = [outline];
			addChild(objText);
			
			//} endregion
			
			//{ region Notifications init
			
			notifBust.x = notifX;
			notifBust.y = notifY;
			notifBust.visible = false;
			notifGreat.x = notifX;
			notifGreat.y = notifY;
			notifGreat.visible = false;
			addChild(notifBust);
			addChild(notifGreat);
			
			//} endregion
			
			//{ region Equation init
			
			eqTextFormat = new TextFormat(eqTextFont.fontName, textSize, 0xFCCC2B, false, false, false, null, null, "left");
			
			equationText.text = "";
			equationText.defaultTextFormat = eqTextFormat;
			equationText.autoSize = TextFieldAutoSize.LEFT;
			equationText.x = 10;
			equationText.y = objectiveY;
			equationText.embedFonts = true;
			equationText.antiAliasType = AntiAliasType.ADVANCED;
			equationText.multiline = false;
			equationText.selectable = false;
			equationText.filters = [outline];
			addChild(equationText);
			
			//} endregion
		}
		
		public function setObjective(obj:int)
		{
			//var first:int = obj / 10;
			//var second:int = obj % 10;
			objText.text = obj.toString();
		}
		

		
		public function setLives(noOfLives:int)
		{
			var x:int = 10;
			var y:int = objectiveY + 40;
			for (var i:int = 0; i < noOfLives; i++)
			{
				var ScoreBust:ScoreBustMC = new ScoreBustMC();
				var ScoreLife:ScoreLifeMC = new ScoreLifeMC();
				ScoreLife.x = x + i * 25;
				ScoreLife.y = y;
				ScoreBust.x = ScoreLife.x;
				ScoreBust.y = ScoreLife.y;
				ScoreBust.visible = false;
				
				addChild(ScoreLife);
				addChild(ScoreBust);
				scoreLifeArray.push(ScoreLife);
				scoreBustArray.push(ScoreBust);
			}
		}
		
		public function showBust(noOfBusts:int)
		{
			//trace(notifBust.visible + "|" + notifBust.x + "|" + notifBust.y);
			notifBust.visible = true;
			scoreLifeArray[noOfBusts].visible = false;
			scoreBustArray[noOfBusts].visible = true;
		}
		
		public function hideBust()
		{
			notifBust.visible = false;
		}
		
		public function showGreat()
		{
			notifGreat.visible = true;
		}
		
		public function hideGreat()
		{
			notifGreat.visible = false;
		}
		
		public function addToEquation(char:String)
		{
			equationText.appendText(char);
		}
	}

}