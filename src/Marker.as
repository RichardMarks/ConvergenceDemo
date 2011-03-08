package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Richard Marks
	 */
	public class Marker extends Entity 
	{
		public function Marker() 
		{
			// set my graphics
			graphic = new Image(Assets.MARKER_GFX);
			
			// start in the center of the screen
			x = FP.width / 2;
			y = FP.height / 2;
		}
		
		override public function update():void 
		{
			// how fast I can move
			const speed:Number = 6.0;// * FP.elapsed;
			
			// move around
			if (Input.check(Key.UP)) { y -= speed; }
			if (Input.check(Key.DOWN)) { y += speed; }
			if (Input.check(Key.LEFT)) { x -= speed; }
			if (Input.check(Key.RIGHT)) { x += speed; }
			
			// warp on screen edges
			if (x < -width) { x = FP.width; }
			if (y < -height) { y = FP.height; }
			if (x > FP.width) { x = -width; }
			if (y > FP.height) { y = -height; }
			
			// tell the soldiers where I am
			Soldier.target.x = x;
			Soldier.target.y = y;
			
			super.update();
		}	
	}
}