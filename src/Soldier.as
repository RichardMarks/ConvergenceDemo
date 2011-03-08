package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Richard Marks
	 */
	public class Soldier extends Entity 
	{
		// static to use outside the class
		// the target location that the soldier will track
		static public var target:Point = new Point();
		
		// the trajectory of the soldier
		private var deltaPosition:Point = new Point();
		
		// the starting location of the soldier
		private var originPosition:Point = new Point();
		
		// The actual bitmapdata of the noise
		static public var noise:BitmapData; 
		
		// Length of the cycle - this is a bit arbitrary
		static public var noiseLength:int = 256; 
		
		// Internal counter (corresponds to the x-pos of the noise bitmap)
		private var noiseCounter:int = 0;
		
		// y-pos of the noise bitmap (different for each soldier)
		public var noiseIndex:int = 0; 
		
		
		public function Soldier(xPos:Number = 0, yPos:Number = 0, noiseIndex:int = 0) 
		{
			// set the soldier's graphics
			graphic = new Image(Assets.SOLDIER_GFX);
			
			// position the soldier
			x = xPos;
			y = yPos;
			
			// set the soldier's noise index
			this.noiseIndex = noiseIndex;
		}
		
		override public function added():void 
		{
			// when a soldier is added to the world, we save its location
			originPosition = new Point(x, y);
			
			super.added();
		}
		
		override public function update():void 
		{
			// calculate the trajectory to the target
			
			/*
			var dx:Number = Soldier.target.x - x;
			var dy:Number = Soldier.target.y - y;
			var length:Number = Math.sqrt((dx * dx) + (dy * dy));
			var speed:Number = FP.random * 4;

			dx /= length;
			dy /= length;

			deltaPosition.x = dx * speed;
			deltaPosition.y = dy * speed;
			*/
			
			//var speed:Number = (FP.random * 4);
			
			var speed:Number = 4 * Math.pow(((noise.getPixel(noiseCounter, noiseIndex) & 0xFF) as Number) / 255, 0.75);
			
			// Increment noise counter:
			noiseCounter = (noiseCounter + 1) % noiseLength;
			
			deltaPosition.x = target.x - x;
			deltaPosition.y = target.y - y;
			deltaPosition.normalize(1.0);
			deltaPosition.x *= speed;
			deltaPosition.y *= speed;
			
			// move towards the target until we are within 20 pixels
			if (Math.abs(x - Soldier.target.x) + Math.abs(y - Soldier.target.y) > 20)
			{
				x += deltaPosition.x;
				y += deltaPosition.y;
			}
			else
			{
				// jump back to our starting position
				x = originPosition.x;
				y = originPosition.y;
			}

			super.update();
		}	
	}
}