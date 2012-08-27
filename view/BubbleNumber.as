package view 
{
	
	import flash.display.*;
	import flash.events.*;
	import flash.filters.GlowFilter;
	import flash.text.*;
	
	public class BubbleNumber extends Sprite
	{
		private var numberText:TextField = new TextField();
		private var numberTextFormat:TextFormat;
		private var numberTextFont:Font = new Marvin();
		private var outline:GlowFilter = new GlowFilter(0xFFFFFF, 1, 6, 6, 10, 1, false, false);
		private var textSize = 35;
		
		public var type:int = 0;
		public var number:int = 0;
		public var value:String = "";
		public var visualBubble:BubbleMC = new BubbleMC();
		
		public function BubbleNumber() 
		{

		}
		
		public function initBubbleNumber(nr:int)
		{
			numberTextFormat = new TextFormat(numberTextFont.fontName, textSize, 0x1370b6, false, false, false, null, null, "center");
			numberTextFormat.font = numberTextFont.fontName;
			
			numberText.x = visualBubble.x;
			numberText.y = visualBubble.height / 8;
			numberText.width = visualBubble.width;
			numberText.height = visualBubble.height;
			
			numberText.defaultTextFormat = numberTextFormat;
			numberText.embedFonts = true;
			numberText.antiAliasType = AntiAliasType.ADVANCED;
			numberText.multiline = false;
			numberText.wordWrap = true;
			numberText.selectable = false;
			numberText.filters = [outline];
			
			value = nr.toString();
			numberText.text = value; 
			
			
			addChild(visualBubble);
			addChild(numberText);
		}
		
		public function resetBubbleNumber()
		{
			removeChild(numberText);
			removeChild(visualBubble);
		}
	}

}