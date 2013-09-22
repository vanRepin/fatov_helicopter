package mediators {
	import events.AddEvent;
	import events.BackEvent;
	import events.GoToScreenEvent;

	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	import screens.MainMenuScreen;
	import screens.SelectVertexShaderOperationScreen;

	import screens.VertexShaderScreen;

	public class VertexShaderScreenMediator extends StarlingMediator {

		[Inject]
		public var view:VertexShaderScreen;


		override public function initialize():void {
			super.initialize();

			view.addEventListener(BackEvent.EVENT_TYPE, onBack);
			view.addEventListener(AddEvent.EVENT_TYPE, onAdd);
		}

		private function onAdd(event:AddEvent):void {
			dispatch(new GoToScreenEvent(SelectVertexShaderOperationScreen));
		}

		private function onBack(event:BackEvent):void {
			dispatch(new GoToScreenEvent(MainMenuScreen));
		}
	}
}
