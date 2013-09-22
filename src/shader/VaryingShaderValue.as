package shader {
	public class VaryingShaderValue extends ShaderValue {
		public function VaryingShaderValue(index:int, alias:String = null) {
			super("v", index, alias);
		}


		override public function get shaderType():int {
			return ShaderType.BOTH;
		}
	}
}
