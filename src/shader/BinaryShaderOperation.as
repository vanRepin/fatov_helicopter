package shader {
	public class BinaryShaderOperation extends ShaderOperation {

		protected var _result:ShaderValue;
		protected var _firstArgument:ShaderValue;
		protected var _secondArgument:ShaderValue;

		public function BinaryShaderOperation(result:ShaderValue = null, firstArgument:ShaderValue = null, secondArgument:ShaderValue = null) {
			_result = result;
			_firstArgument = firstArgument;
			_secondArgument = secondArgument;
		}

		public function get result():ShaderValue {
			return _result;
		}

		public function set result(value:ShaderValue):void {
			_result = value;
		}

		public function get firstArgument():ShaderValue {
			return _firstArgument;
		}

		public function set firstArgument(value:ShaderValue):void {
			_firstArgument = value;
		}

		public function get secondArgument():ShaderValue {
			return _secondArgument;
		}

		public function set secondArgument(value:ShaderValue):void {
			_secondArgument = value;
		}
	}
}
