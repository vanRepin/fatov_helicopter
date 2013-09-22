package screens {
	import events.AddEvent;

	import feathers.controls.Button;
	import feathers.controls.LayoutGroup;
	import feathers.controls.List;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.core.IFeathersControl;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalLayout;

	import shader.ShaderRegistry;

	import starling.events.Event;

	public class VertexShaderScreen extends BaseScreen {

		public static const ADD_SHADER_LINE:String = "addShaderLine";

		private var _list:List;

		private var addButton:Button;
		private var removeButton:Button;
		private var editButton:Button;

		private var footerGroup:LayoutGroup;


		public function VertexShaderScreen() {
			headerProperties.title = "Vertex Shader";

			layout = new AnchorLayout();

			_list = new List();
			_list.addEventListener(Event.CHANGE, onListChange);
			_list.layoutData = new AnchorLayoutData(0, 0, 0, 0);

			_list.itemRendererFactory = function ():IListItemRenderer {
				var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
				renderer.labelField = "view";
				renderer.defaultLabelProperties.wordWrap = true;
				return renderer;
			};
			addChild(_list);

			footerGroup = new LayoutGroup();
			var horizontalLayout:HorizontalLayout = new HorizontalLayout();
			horizontalLayout.gap = 5;
			footerGroup.layout = horizontalLayout;
			addButton = new Button();
			addButton.label = "+";
			addButton.addEventListener(Event.TRIGGERED, onAdd);
			footerGroup.addChild(addButton);

			removeButton = new Button();
			removeButton.visible = false;
			removeButton.label = "-";
			footerGroup.addChild(removeButton);

			editButton = new Button();
			editButton.visible = false;
			editButton.label = "edit";
			footerGroup.addChild(editButton);

			footerFactory = function ():IFeathersControl {
				return  footerGroup;
			};
		}

		private function onAdd(event:Event):void {
			dispatchEvent(new AddEvent());
		}

		private function onListChange(event:Event):void {
			if (_list.selectedItem != null) {
				editButton.visible = true;
				removeButton.visible = true;
			} else {
				editButton.visible = false;
				removeButton.visible = false;
			}
		}
	}
}
