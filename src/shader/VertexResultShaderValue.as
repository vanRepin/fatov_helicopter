package shader {
	public class VertexResultShaderValue extends ShaderValue {
		public function VertexResultShaderValue() {
			super("op", 0, "resultPosition");
		}

		override public function get shaderType():int {
			return ShaderType.VERTEX;
		}
	}
}
