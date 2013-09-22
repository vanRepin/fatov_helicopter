package shader {
	public class ShaderRegistry {
		public static const values:Object = {
			op: new VertexResultShaderValue(),
			vc0: new VertexConstantShaderValue(0, "MVP"),
			vc1: new VertexConstantShaderValue(1, "MVP_2Line"),
			vc2: new VertexConstantShaderValue(2, "MVP_3Line"),
			vc3: new VertexConstantShaderValue(3, "MVP_4Line"),
			vc4: new VertexConstantShaderValue(4),
			vc5: new VertexConstantShaderValue(5),
			vc6: new VertexConstantShaderValue(6),
			vc7: new VertexConstantShaderValue(7),
			vc8: new VertexConstantShaderValue(8),
			vc9: new VertexConstantShaderValue(9),
			vc10: new VertexConstantShaderValue(10),
			vc11: new VertexConstantShaderValue(11),
			vc12: new VertexConstantShaderValue(12),
			vc13: new VertexConstantShaderValue(13),
			vc14: new VertexConstantShaderValue(14),
			vc15: new VertexConstantShaderValue(15),
			vc16: new VertexConstantShaderValue(16),

			va0: new VertexAttributeShaderValue(0, "vertexPosition"),
			va1: new VertexAttributeShaderValue(1),
			va2: new VertexAttributeShaderValue(2),
			va3: new VertexAttributeShaderValue(3),
			va4: new VertexAttributeShaderValue(4),
			va5: new VertexAttributeShaderValue(5),
			va6: new VertexAttributeShaderValue(6),
			va7: new VertexAttributeShaderValue(7),

			v0: new VaryingShaderValue(0),
			v1: new VaryingShaderValue(1),
			v2: new VaryingShaderValue(2),
			v3: new VaryingShaderValue(3),
			v4: new VaryingShaderValue(4),
			v5: new VaryingShaderValue(5),
			v6: new VaryingShaderValue(6),
			v7: new VaryingShaderValue(7)
		};

		public static const currentVertexShader:Vector.<ShaderOperation> = new <ShaderOperation>[];
	}
}
