package com.powerflasher.SampleApp
{
	import reflex.behaviors.TouchScrollBehavior;
	import reflex.collections.SimpleCollection;
	import reflex.components.List;
	import reflex.components.Scroller;
	import reflex.components.VSlider;
	import reflex.containers.Group;

	/**
	 * @author mwallace
	 */
	public class ReflexListExample extends Group
	{
		public function ReflexListExample()
		{
			super();
			percentWidth = 100;
			percentHeight = 100;
			
			var levels:SimpleCollection = new SimpleCollection();
			
			for (var i : int = 0; i < 500; i++) {
				levels.addItem({label: "Level " + i});
			}
			
			
			
			var scroller:Scroller = new Scroller();
			scroller.style = "left: 0; right: 0; top: 0; bottom: 0;";
			var list:List = new List();
			list.percentWidth = 100;
			list.dataProvider = levels;
			scroller.content = [list];
			
			var slider:VSlider = new VSlider();
			slider.style = "right: 0; top: 0; bottom: 0;";
			slider.position = scroller.verticalPosition;
			
			scroller.behaviors.addItem( new TouchScrollBehavior(scroller, false, true) );
			this.content = [scroller, slider];

			
		}

	}
}
