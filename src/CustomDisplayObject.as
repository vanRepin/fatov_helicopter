package {
	import com.adobe.utils.AGALMiniAssembler;

	import flash.display3D.Context3D;
	import flash.display3D.Context3DProgramType;
	import flash.display3D.IndexBuffer3D;
	import flash.display3D.VertexBuffer3D;

	import starling.core.Starling;

	import starling.display.DisplayObject;
	import starling.utils.VertexData;

	public class CustomDisplayObject extends DisplayObject {
		private static const PROGRAM_NAME:String = "CustomDisplayObject";

		private var indexBuffer:IndexBuffer3D;
		private var vertexBuffer:VertexBuffer3D;
		private var vertexData:VertexData = new VertexData(4);


		private function createBuffers():void {

			var indices:Vector.<uint> = Vector.<uint>([0, 1, 2, 1, 3, 2]);
			vertexData.setPosition(0, 0, 0);
			vertexData.setPosition(1, width, 0);
			vertexData.setPosition(2, 0, height);
			vertexData.setPosition(3, width, height);

			var context:Context3D = Starling.context;
			if (indexBuffer == null) {
				indexBuffer = context.createIndexBuffer(indices.length);
				indexBuffer.uploadFromVector(indices, 0, indices.length);
			}
			vertexBuffer = context.createVertexBuffer(4, VertexData.ELEMENTS_PER_VERTEX);
			vertexBuffer.uploadFromVector(vertexData.rawData, 0, 4);
		}

		private static function registerPrograms():void {
			var target:Starling = Starling.current;
			var vertexProgramCode:String = [
				"m44 op, va0, vc0",
				"mov v0, va1"
			].join("\n");
			if (!target.hasProgram(PROGRAM_NAME)) {
				registerProgram(PROGRAM_NAME, vertexProgramCode, [
					"tex oc, v0, ft0 <2d, clamp, linear, mipnone>"
				].join("\n"), target);
			}
		}

		private static function registerProgram(name:String, vertex:String, fragment:String, starling:Starling):void {
			var vertexProgramAssembler:AGALMiniAssembler = new AGALMiniAssembler();
			vertexProgramAssembler.assemble(Context3DProgramType.VERTEX, vertex);

			var fragmentProgramAssembler:AGALMiniAssembler = new AGALMiniAssembler();
			fragmentProgramAssembler.assemble(Context3DProgramType.FRAGMENT, fragment);

			starling.registerProgram(name, vertexProgramAssembler.agalcode,
					fragmentProgramAssembler.agalcode);
		}

	}
}
