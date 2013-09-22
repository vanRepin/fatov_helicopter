package {

	import flash.display.Sprite;

	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;

	import starling.core.Starling;

	[SWF(width=1200, height=800, frameRate=60)]
	public class Helicopter extends Sprite {

		public function Helicopter() {
			var context:IContext = new Context();
			context.install(MVCSBundle, StarlingViewMapExtension)
					.configure(new Starling(MainView, stage))
					.configure(new ContextView(this))
					.configure(StarlingConfig, MainConfig)
					.initialize();
		}
	}
}
