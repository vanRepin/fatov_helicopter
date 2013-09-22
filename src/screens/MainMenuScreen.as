package screens {
	import events.MainMenuSelectedEvent;

	import feathers.controls.List;
	import feathers.controls.PanelScreen;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.skins.StandardIcons;
	import feathers.system.DeviceCapabilities;

	import starling.core.Starling;
	import starling.events.Event;
	import starling.textures.Texture;

	public class MainMenuScreen extends PanelScreen {

		private var _list:List;

		public function MainMenuScreen() {
			addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}


		protected function initializeHandler(event:Event):void {
			var isTablet:Boolean = DeviceCapabilities.isTablet(Starling.current.nativeStage);

			layout = new AnchorLayout();

			headerProperties.title = "Main Menu";

			_list = new List();
			_list.dataProvider = new ListCollection(
					[
						{ text: "Vertex Shader", screen: VertexShaderScreen },
						{ text: "Aliases", screen: AliasesScreen },
						{ text: "Fragment Shader", screen: "showFragmentShader" },
						{ text: "VertexBuffer", screen: "showVertexBuffer" },
						{ text: "IndexBuffer", screen: "showIndexBuffer" }
					]);
			_list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			_list.addEventListener(Event.CHANGE, listChanged);

			var itemRendererAccessorySourceFunction:Function = null;
			if (!isTablet) {
				itemRendererAccessorySourceFunction = accessorySourceFunction;
			}
			_list.itemRendererFactory = function ():IListItemRenderer {
				var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();

				//enable the quick hit area to optimize hit tests when an item
				//is only selectable and doesn't have interactive children.
				renderer.isQuickHitAreaEnabled = true;
				renderer.labelField = "text";
				renderer.accessorySourceFunction = itemRendererAccessorySourceFunction;
				return renderer;
			};

			if (isTablet) {
				_list.selectedIndex = 0;
			}
			addChild(_list);
		}

		public function reset():void {
			if (_list) {
				_list.selectedIndex = -1;
			}
		}

		private function accessorySourceFunction(item:Object):Texture {
			return StandardIcons.listDrillDownAccessoryTexture;
		}

		private function listChanged(event:Event):void {
			if (_list.selectedItem) {
				const screenClass:Class = _list.selectedItem.screen as Class;
				dispatchEvent(new MainMenuSelectedEvent(screenClass));
			}
		}
	}
}
