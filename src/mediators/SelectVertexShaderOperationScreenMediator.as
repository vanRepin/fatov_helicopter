package mediators {
	import events.BackEvent;
	import events.GoToScreenEvent;

	import feathers.data.ListCollection;

	import models.OperationModel;
	import models.VertexShaderModel;

	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	import screens.SelectVertexShaderOperationScreen;
	import screens.VertexShaderScreen;

	import starling.events.Event;

	public class SelectVertexShaderOperationScreenMediator extends StarlingMediator {

		[Inject]
		public var view:SelectVertexShaderOperationScreen;

		[Inject]
		public var vertexShaderModel:VertexShaderModel;

		[Inject]
		public var operationModel:OperationModel;

		override public function initialize():void {
			super.initialize();

			var items:Array = [];
			for each (var c:Class in vertexShaderModel.supportedOperations) {
				var item:Object = {text: operationModel.getDescription(c).text, operation: c};
				items.push(item);
			}

			view.dataProvider = new ListCollection(items);

			view.addEventListener(Event.COMPLETE, onOperationSelected);
			view.addEventListener(BackEvent.EVENT_TYPE, onBack);
		}

		private function onBack(event:BackEvent):void {
			dispatch(new GoToScreenEvent(VertexShaderScreen));
		}

		private function onOperationSelected(event:Event):void {

		}
	}
}
