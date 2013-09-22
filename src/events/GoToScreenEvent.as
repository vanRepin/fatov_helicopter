package events {

	import flash.events.Event;

	public class GoToScreenEvent extends Event {

		public static const EVENT_TYPE:String = "GoToScreenEvent";
		private var _screen:Class;

		public function GoToScreenEvent(screen:Class) {
			super(EVENT_TYPE);
			_screen = screen;
		}

		public function get screen():Class {
			return _screen;
		}
	}
}
