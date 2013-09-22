package mediators {
	import events.GoToScreenEvent;
	import events.MainMenuSelectedEvent;

	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	import screens.MainMenuScreen;
	import screens.ScreenFactory;

	public class MainMenuScreenMediator extends StarlingMediator {

		[Inject]
		public var view:MainMenuScreen;

		[Inject]
		public var screenFactory:ScreenFactory;


		override public function initialize():void {
			super.initialize();
			view.addEventListener(MainMenuSelectedEvent.EVENT_TYPE, onShowScreen);
			view.reset();
		}

		private function onShowScreen(event:MainMenuSelectedEvent):void {
			dispatch(new GoToScreenEvent(event.screen));
		}


		override public function destroy():void {
			super.destroy();
			view.removeEventListener(MainMenuSelectedEvent.EVENT_TYPE, onShowScreen);
		}
	}
}
