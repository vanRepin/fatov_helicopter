package screens {
	import flash.utils.Dictionary;

	import starling.display.DisplayObject;

	public class ScreenFactory {

		private var screenCache:Dictionary = new Dictionary();

		public function getScreen(screenClass:Class):DisplayObject {
			var screen:DisplayObject = screenCache[screenClass];
			if (screen) {
				return screen;
			}

			return screenCache[screenClass] = new screenClass();
		}
	}
}
