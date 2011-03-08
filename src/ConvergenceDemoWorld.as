package  
{
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
			// background
			add(new Entity(0, 0, new Image(Assets.BACKGROUND_GFX)));
			
			// soldiers are randomly positioned
			for (var i:Number = 0; i < SOLDIER_COUNT; i++)
			{
				add(new Soldier(FP.random * FP.width, FP.random * FP.height));
			}
			
			// the "player" marker that the soldiers track
			add(new Marker());
			
			super.begin();
		}
	}

}