package screens {
	import feathers.controls.List;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.skins.StandardIcons;

	import shader.M44Operation;

	import starling.events.Event;
	import starling.textures.Texture;

	public class SelectVertexShaderOperationScreen extends BaseScreen {
		private var _list:List;

		public function SelectVertexShaderOperationScreen() {
			layout = new AnchorLayout();

			headerProperties.title = "Select shader operation";

			_list = new List();
			_list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			_list.addEventListener(Event.CHANGE, listChanged);

			_list.itemRendererFactory = function ():IListItemRenderer {
				var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();

				//enable the quick hit area to optimize hit tests when an item
				//is only selectable and doesn't have interactive children.
				renderer.isQuickHitAreaEnabled = true;
				renderer.labelField = "text";
				renderer.accessorySourceFunction = accessorySourceFunction;
				return renderer;
			};
			addChild(_list);
		}

		private function accessorySourceFunction(item:Object):Texture {
			return StandardIcons.listDrillDownAccessoryTexture;
		}

		public function set dataProvider(provider:ListCollection):void {
			_list.dataProvider = provider;
		}

		private function listChanged(event:Event):void {
			dispatchEventWith(Event.COMPLETE, false, _list.selectedItem.operation);
		}
	}
}
