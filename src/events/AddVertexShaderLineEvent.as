package events {
	import starling.events.Event;

	public class AddVertexShaderLineEvent extends Event {

		public static const EVENT_TYPE:String = "AddVertexShaderLineEvent";

		public function AddVertexShaderLineEvent() {
			super(EVENT_TYPE);
		}
	}
}
