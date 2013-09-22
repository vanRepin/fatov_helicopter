package shader {
	public class VertexAttributeShaderValue extends ShaderValue {
		public function VertexAttributeShaderValue(index:int, alias:String = null) {
			super("va", index, alias);
		}


		override public function get shaderType():int {
			return ShaderType.VERTEX;
		}
	}
}
