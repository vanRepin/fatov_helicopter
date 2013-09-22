package events {
	import starling.events.Event;

	public class BackEvent extends Event {

		public static const EVENT_TYPE:String = "BackEvent";

		public function BackEvent() {
			super(EVENT_TYPE);
		}
	}
}
