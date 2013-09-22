package shader {
	public class ShaderValue {

		protected var _alias:String;
		protected var _text:String;

		private var _classifier:String;
		private var _index:int;

		public function ShaderValue(classifier:String, index:int, alias:String = null) {
			_classifier = classifier;
			_index = index;
			_text = classifier + index.toString();
			if (alias) {
				_alias = alias;
			} else {
				_alias = text;
			}
		}

		public function get text():String {
			return _text;
		}

		public function get alias():String {
			return _alias;
		}

		public function set alias(value:String):void {
			_alias = value;
		}

		public function get classifier():String {
			return _classifier;
		}

		public function get index():int {
			return _index;
		}

		public function get shaderType():int {
			return 0;
		}
	}
}
