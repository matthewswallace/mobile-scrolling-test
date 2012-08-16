package com.powerflasher.SampleApp
{
	import starling.display.Stage;
	import flash.utils.setTimeout;
	import starling.display.Sprite;
	import starling.events.Event;

	import org.josht.starling.foxhole.controls.List;
	import org.josht.starling.foxhole.data.ListCollection;

	/**
	 * @author mwallace
	 */
	public class FoxholeExample extends Sprite
	{
		private var scrollingList : List;
		public function FoxholeExample()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}

		private function onAddedToStage(event : Event) : void
		{
			
			
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			var items:Array = [];
			for(var i:int = 0; i < 150; i++)
			{
				var item:Object = {text: "Item " + (i + 1).toString()};
				items.push(item);
			}
			
			items.fixed = true;
			
			scrollingList = new List();
			scrollingList.dataProvider = new ListCollection(items);
			scrollingList.typicalItem = {text: "Item 1000"};
			scrollingList.isSelectable = true;
			scrollingList.scrollerProperties.hasElasticEdges = true;
			scrollingList.itemRendererProperties.labelField = "text";
			scrollingList.onChange.add(list_onChange);
			
			
			scrollingList.visible = true;
			addChildAt(scrollingList, 0);
			
			setTimeout(function():void{
				trace(parent.width);
				scrollingList.width = parent.width;
				scrollingList.height = parent.height;
				
			}, 5000)

		}

		private function list_onChange(list:List) : void
		{
			trace("List onChange:", scrollingList.selectedIndex);
		}
	}
}
