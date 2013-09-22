package {
	import feathers.themes.MetalWorksMobileTheme;

	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;

	public class MainView extends DisplayObjectContainer {

		private var currentScreen:DisplayObject;

		public function MainView() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void {
			stage.addEventListener(Event.RESIZE, onResize);
			new MetalWorksMobileTheme();
		}

		public function showScreen(screen:DisplayObject):void {
			if (currentScreen) {
				removeChild(currentScreen);
			}

			currentScreen = screen;
			addChild(currentScreen);
			currentScreen.width = stage.stageWidth;
			currentScreen.height = stage.stageHeight;
		}

		private function onResize(event:Event):void {
			if (currentScreen != null) {
				currentScreen.width = stage.stageWidth;
				currentScreen.height = stage.stageHeight;
			}
		}
	}
}
