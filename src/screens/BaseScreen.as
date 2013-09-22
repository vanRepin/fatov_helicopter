package screens {
	import events.BackEvent;

	import feathers.controls.Button;
	import feathers.controls.PanelScreen;
	import feathers.system.DeviceCapabilities;

	import starling.core.Starling;

	import starling.display.DisplayObject;
	import starling.events.Event;

	public class BaseScreen extends PanelScreen {
		public function BaseScreen() {
			if (!DeviceCapabilities.isTablet(Starling.current.nativeStage)) {
				var backButton:Button = new Button();
				backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
				backButton.label = "Back";
				backButton.addEventListener(Event.TRIGGERED, onBackButton);

				headerProperties.leftItems = new <DisplayObject> [
					backButton
				];

				backButtonHandler = onBackButton;
			}
		}

		private function onBackButton(event:Event = null):void {
			dispatchEvent(new BackEvent());
		}
	}
}
