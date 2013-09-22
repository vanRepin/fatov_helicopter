package {
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.TextInput;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.layout.HorizontalLayout;

	import shader.ShaderValue;

	import starling.events.Event;

	public class AliasEditor extends List implements IListItemRenderer {

		private var _owner:List;
		private var _index:int;
		private var _value:ShaderValue;

		private var _label:Label;
		private var _textInput:TextInput;
		private var _selected:Boolean;

		public function AliasEditor() {
			layout = new HorizontalLayout();

			_label = new Label();
			addChild(_label);
			_textInput = new TextInput();
			addChild(_textInput);
			_textInput.addEventListener(Event.CHANGE, onChange);
			width = 200;
			height = 60;
		}

		private function onChange(event:Event):void {
			if (_value != null) {
				_value.alias = _textInput.text;
			}
		}

		public function get data():Object {
			return _value;
		}

		public function set data(value:Object):void {
			_value = ShaderValue(value);
			if (_value != null) {
				_label.text = _value.text;
				_textInput.text = _value.alias;
				_textInput.x = 100;
			}
		}

		public function get index():int {
			return _index;
		}

		public function set index(value:int):void {
			_index = value;
		}

		public function get owner():List {
			return _owner;
		}

		public function set owner(value:List):void {
			_owner = value;
		}

		public function get isSelected():Boolean {
			return _selected;
		}

		public function set isSelected(value:Boolean):void {
			_selected = value;
		}
	}
}
