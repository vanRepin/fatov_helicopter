package models {
	import flash.utils.Dictionary;

	import shader.M44Operation;

	import vos.OperationDescription;

	public class OperationModel {

		private var operations:Dictionary = new Dictionary();

		public function OperationModel() {
			operations[M44Operation] = new OperationDescription("m44", "multiply vector by matrix 4x4");
		}

		public function getDescription(operation:Class):OperationDescription {
			return operations[operation];
		}
	}
}
