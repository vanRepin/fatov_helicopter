package vos {
	public class OperationDescription {

		private var _text:String;
		private var _description:String;
		public function OperationDescription(text:String, description:String) {
			_text = text;
			_description = description;
		}

		public function get text():String {
			return _text;
		}

		public function get description():String {
			return _description;
		}
	}
}
