package screens {
	import shader.*;
	import feathers.controls.List;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;

	import shader.ShaderRegistry;
	import shader.ShaderValue;

	public class AliasesScreen extends BaseScreen {
		public function AliasesScreen() {
			headerProperties.title = "Aliases";

			layout = new AnchorLayout();
			var list:List = new List();
			list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			addChild(list);
			var aliases:Vector.<ShaderValue> = new Vector.<ShaderValue>();
			for each(var value:ShaderValue in ShaderRegistry.values) {
				aliases.push(value);
			}
			aliases.sort(function (left:ShaderValue, right:ShaderValue):int {
				if (left.classifier != right.classifier) {
					return left.classifier < right.classifier ? -1 : 1;
				}
				return left.index - right.index;
			});

			list.dataProvider = new ListCollection(aliases);

			list.itemRendererFactory = function ():IListItemRenderer {
				var renderer:AliasEditor = new AliasEditor();
				return renderer;
			};
		}
	}
}
