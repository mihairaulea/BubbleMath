package view 
{
	import flash.display.*;
	
	public class Background extends Sprite
	{
		var backgroundSky:BackgroundSkyMC = new BackgroundSkyMC();
		var backgroundGrass:BackgroundGrassMC = new BackgroundGrassMC();
		
		var backgroundSun:BackgroundSunMC = new BackgroundSunMC();
		
		var backgroundCloud1:BackgroundCloud1MC = new BackgroundCloud1MC();
		var backgroundCloud2:BackgroundCloud2MC = new BackgroundCloud2MC();
		var backgroundCloud3:BackgroundCloud3MC = new BackgroundCloud3MC();
		
		public function Background() 
		{
		
		}
		
		public function init(width:int, height:int)
		{
			backgroundSky.x = 0;
			backgroundSky.y = 0;
			
			backgroundGrass.x = width / 2;
			backgroundGrass.y = height - 35;
			
			if (width > 800)
			{
				backgroundSky.width = width;
				backgroundGrass.width = width;
			}
			
			if (height > 600)
			{
				backgroundSky.height = height;
			}
			
			backgroundSun.x = width - 125;
			backgroundSun.y = -30;
			
			backgroundCloud1.x = -40;
			backgroundCloud1.y = height / 4;
			
			backgroundCloud2.x = 150;
			backgroundCloud2.y = height / 2;
			
			backgroundCloud3.x = 380 + Math.abs(width -600);
			backgroundCloud3.y = 170;
			
			addChild(backgroundSky);
			addChild(backgroundGrass);
			addChild(backgroundSun);
			
			addChild(backgroundCloud1);
			addChild(backgroundCloud2);
			addChild(backgroundCloud3);
			
		}
		
	}

}