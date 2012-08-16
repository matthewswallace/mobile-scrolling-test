package com.powerflasher.SampleApp
{
	import flash.ui.Mouse;
	import org.josht.starling.foxhole.themes.AzureTheme;
	import org.josht.starling.foxhole.themes.IFoxholeTheme;
	import org.josht.starling.foxhole.controls.ScreenNavigatorItem;
	import starling.events.Event;
	import org.josht.starling.foxhole.controls.ScreenNavigator;
	import starling.display.Sprite;

	/**
	 * @author mwallace
	 */
	public class MainStarling extends Sprite
	{
		private var _nav:ScreenNavigator;
		private var _theme:IFoxholeTheme;
		
		public function MainStarling()
		{	
			addEventListener(Event.ADDED_TO_STAGE, onAdded);	
		}

		private function onAdded(event : Event) : void
		{
			const isDesktop:Boolean = Mouse.supportsCursor;
			
			_theme = new AzureTheme(stage);
			_nav = new ScreenNavigator();
			addChild(_nav);
			
			_nav.addScreen("mainScreen", new ScreenNavigatorItem(FoxholeExample));
			
			_nav.showScreen("mainScreen");
		}
	}
}
