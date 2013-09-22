package events {
	import starling.events.Event;

	public class AddEvent extends Event {
		public static const EVENT_TYPE:String = "AddEvent";

		public function AddEvent() {
			super(EVENT_TYPE);
		}
	}
}
