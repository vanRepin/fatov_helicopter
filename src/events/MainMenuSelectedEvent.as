package events {
	import starling.events.Event;

	public class MainMenuSelectedEvent extends Event {
		public static const EVENT_TYPE:String = "MainMenuSelectedEvent";
		private var _screen:Class;

		public function MainMenuSelectedEvent(screenClass:Class) {
			super(EVENT_TYPE);
			_screen = screenClass;
		}

		public function get screen():Class {
			return _screen;
		}
	}
}
