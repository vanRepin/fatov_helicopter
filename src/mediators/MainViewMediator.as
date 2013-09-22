package mediators {
	import events.GoToScreenEvent;

	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	import screens.MainMenuScreen;

	import screens.ScreenFactory;

	public class MainViewMediator extends StarlingMediator {

		[Inject]
		public var view:MainView;

		[Inject]
		public var screenFactory:ScreenFactory;

		override public function initialize():void {
			super.initialize();
			addContextListener(GoToScreenEvent.EVENT_TYPE, onShowScreen);
			eventDispatcher.dispatchEvent(new GoToScreenEvent(MainMenuScreen));
		}

		private function onShowScreen(event:GoToScreenEvent):void {
			view.showScreen(screenFactory.getScreen(event.screen));
		}
	}
}
