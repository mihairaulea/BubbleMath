package view 
{
	import flash.display.*;
	import flash.filters.GlowFilter;
	import flash.text.*;
	import flash.events.*;

	import com.greensock.*;
	
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
		
		//Score text
		private var scoreText:TextField = new TextField();
		private var scoreTextFormat:TextFormat;
		private var scoreTextFont:Font = new Marvin();
		
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
			notifBust.alpha = 0;
			notifGreat.x = notifX;
			notifGreat.y = notifY;
			notifGreat.alpha = 0;
			addChild(notifBust);
			addChild(notifGreat);
			
			//} endregion
			
			//{ region Equation init
			
			eqTextFormat = new TextFormat(eqTextFont.fontName, textSize, 0xFCCC2B, false, false, false, null, null, "left");
			
			equationText.text = "";
			equationText.defaultTextFormat = eqTextFormat;
			equationText.autoSize = TextFieldAutoSize.LEFT;
			equationText.x = 10;
			equationText.y = objectiveY + 15;
			equationText.embedFonts = true;
			equationText.antiAliasType = AntiAliasType.ADVANCED;
			equationText.multiline = false;
			equationText.selectable = false;
			equationText.filters = [outline];
			addChild(equationText);
			
			//} endregion
			
			//{ region Score text init
			
			scoreTextFormat = new TextFormat(scoreTextFont.fontName, textSize, 0xFF5A00, false, false, false, null, null, "left");
			
			scoreText.defaultTextFormat = scoreTextFormat;
			scoreText.autoSize = TextFieldAutoSize.LEFT;
			scoreText.x = 10;
			scoreText.y = notifY * 1.60;
			scoreText.embedFonts = true;
			scoreText.antiAliasType = AntiAliasType.ADVANCED;
			scoreText.multiline = false;
			scoreText.selectable = false;
			scoreText.filters = [outline];
			scoreText.text = "0";
			addChild(scoreText);
			
			//} endregion 
		}
		
		public function setObjective(obj:int)
		{
			objText.text = obj.toString();
		}
		
		public function setScore(score:int)
		{
			scoreText.text = score.toString();
		}
		
		public function setLives(noOfLives:int)
		{
			var x:int = 10;
			var y:int = objectiveY - 10;
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
			notifBust.alpha = 1
			TweenLite.to(notifBust, 3, { alpha:0 });
			scoreLifeArray[noOfBusts].visible = false;
			scoreBustArray[noOfBusts].visible = true;
		}
		
		
		public function showGreat()
		{
			notifGreat.alpha = 1
			TweenLite.to(notifGreat, 3, { alpha:0 });
			
		}
		
		public function resetLives()
		{
			for each(var scoreLife in scoreLifeArray)
				scoreLife.visible = true;
			for each(var scoreBust in scoreBustArray)
				scoreBust.visible = false;
		}
		
		public function updateEquation(char:String)
		{
			equationText.text = char;
		}
	}

}