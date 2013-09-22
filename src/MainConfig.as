package {
	import events.GoToScreenEvent;

	import flash.events.IEventDispatcher;

	import mediators.MainMenuScreenMediator;

	import mediators.MainViewMediator;
	import mediators.SelectVertexShaderOperationScreenMediator;
	import mediators.VertexShaderScreenMediator;

	import models.OperationModel;

	import models.VertexShaderModel;

	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	import screens.MainMenuScreen;

	import screens.ScreenFactory;
	import screens.SelectVertexShaderOperationScreen;
	import screens.VertexShaderScreen;

	public class MainConfig implements IConfig {

		[Inject]
		public var injector:IInjector;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var eventDispatcher:IEventDispatcher;

		public function configure():void {
			var screenFactory:ScreenFactory = new ScreenFactory();
			injector.map(ScreenFactory).toValue(screenFactory);

			injector.map(VertexShaderModel).asSingleton();
			injector.map(OperationModel).asSingleton();

			mediatorMap.map(MainView).toMediator(MainViewMediator);
			mediatorMap.map(MainMenuScreen).toMediator(MainMenuScreenMediator);
			mediatorMap.map(VertexShaderScreen).toMediator(VertexShaderScreenMediator);
			mediatorMap.map(SelectVertexShaderOperationScreen).toMediator(SelectVertexShaderOperationScreenMediator);
		}
	}
}
