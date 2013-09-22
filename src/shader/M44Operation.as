package shader {
	public class M44Operation extends BinaryShaderOperation {

		public static const allowedInput:Array = [VaryingShaderValue, VertexAttributeShaderValue, VertexConstantShaderValue];
		public static const allowedOutput:Array = [VaryingShaderValue, VertexAttributeShaderValue, VertexResultShaderValue];

		public function M44Operation(result:ShaderValue = null, firstArgument:ShaderValue = null, secondArgument:ShaderValue = null) {
			super(result, firstArgument, secondArgument);
		}


		override public function get text():String {
			if (!_result || !_firstArgument || !_secondArgument) return "";
			return "m44 " + _result.text + "," + _firstArgument.text + "," + _secondArgument.text;
		}


		override public function get view():String {
			if (!_result || !_firstArgument || !_secondArgument) return "";
			return _result.alias + " = " + _firstArgument.alias + " * " + _secondArgument.alias;
		}
	}
}
