package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author Richard Marks
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Engine 
	{
		public function Main():void 
		{
			super(800, 600, 32, true);
		}
		
		override public function init():void 
		{
			FP.world = new ConvergenceDemoWorld;
			super.init();
		}
	}
}