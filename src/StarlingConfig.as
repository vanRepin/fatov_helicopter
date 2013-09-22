package {
	import feathers.themes.MetalWorksMobileTheme;

	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Rectangle;

	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	import starling.core.Starling;

	public class StarlingConfig implements IConfig {

		[Inject]
		public var injector:IInjector;

		[Inject]
		public var contextView:ContextView;

		[Inject]
		public var _starling:Starling;

		public function configure():void {
			var stage:Stage = contextView.view.stage;
			stage.addEventListener(Event.RESIZE, resizeHandler, false, int.MAX_VALUE, true);
			_starling.start();
		}

		private function resizeHandler(event:Event = null):void {
			var stage:Stage = contextView.view.stage;
			_starling.stage.stageWidth = stage.stageWidth;
			_starling.stage.stageHeight = stage.stageHeight;

			const viewPort:Rectangle = _starling.viewPort;
			viewPort.width = stage.stageWidth;
			viewPort.height = stage.stageHeight;
			_starling.viewPort = viewPort;
		}
	}
}
