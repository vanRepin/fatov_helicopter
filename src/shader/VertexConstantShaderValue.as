package shader {
	public class VertexConstantShaderValue extends ShaderValue {
		public function VertexConstantShaderValue(index:int, alias:String = null) {
			super("vc", index, alias);
		}

		override public function get shaderType():int {
			return ShaderType.VERTEX;
		}
	}
}
