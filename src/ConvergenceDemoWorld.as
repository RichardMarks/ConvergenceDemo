package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Richard Marks
	 */
	public class ConvergenceDemoWorld extends World 
	{
		// number of soldiers in the demo
		static public const SOLDIER_COUNT:Number = 30;
		
		public function ConvergenceDemoWorld() {}
		
		override public function begin():void 
		{
			// initialize the perlin noise bitmap for the soldiers
			Soldier.noise = new BitmapData(Soldier.noiseLength, SOLDIER_COUNT, false, 0x00CCCCCC);
			var seed:Number = Math.floor(Math.random() * 10);
			Soldier.noise.perlinNoise(Soldier.noise.width, Soldier.noise.height, 10, seed, true, false, 7, true, null);
			
			// background
			add(new Entity(0, 0, new Image(Assets.BACKGROUND_GFX)));
			
			// soldiers are randomly positioned
			for (var i:Number = 0; i < SOLDIER_COUNT; i++)
			{
				add(new Soldier(FP.random * FP.width, FP.random * FP.height, i));
			}
			
			// the "player" marker that the soldiers track
			add(new Marker());
			
			super.begin();
		}
	}

}