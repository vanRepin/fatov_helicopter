package models {
	import shader.M44Operation;
	import shader.ShaderOperation;

	public class VertexShaderModel {

		private var _currentOperation:ShaderOperation;

		private const _supportedOperations:Array = [M44Operation];

		public function get currentOperation():ShaderOperation {
			return _currentOperation;
		}

		public function set currentOperation(value:ShaderOperation):void {
			_currentOperation = value;
		}

		public function get supportedOperations():Array {
			return _supportedOperations;
		}
	}
}
