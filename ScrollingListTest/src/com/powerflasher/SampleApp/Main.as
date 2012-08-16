package com.powerflasher.SampleApp
{
	import flash.geom.Rectangle;
	import reflex.containers.Application;

	import starling.core.Starling;

	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	[SWF(backgroundColor="#FFFFFF", frameRate="60")]
	public class Main extends Application
	{
		private var _starling : Starling;
		private var listExample : ReflexListExample;

		public function Main()
		{
			if (this.stage)
			{
				this.stage.scaleMode = StageScaleMode.NO_SCALE;
				this.stage.align = StageAlign.TOP_LEFT;
			}
			this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		}

		private function loaderInfo_completeHandler(event : Event) : void
		{
			// listExample = new ReflexListExample();
			// content = [listExample];

			Starling.handleLostContext = true;
			Starling.multitouchEnabled = true;
			this._starling = new Starling(MainStarling, this.stage);
			this._starling.enableErrorChecking = false;
			this._starling.showStats = true;
			this._starling.start();

			this.stage.addEventListener(Event.RESIZE, stage_resizeHandler, false, int.MAX_VALUE, true);
			this.stage.addEventListener(Event.DEACTIVATE, stage_deactivateHandler, false, 0, true);
		}

		private function stage_deactivateHandler(event : Event) : void
		{
			this._starling.stop();
			this.stage.addEventListener(Event.ACTIVATE, stage_activateHandler, false, 0, true);
		}

		private function stage_activateHandler(event : Event) : void
		{
			this.stage.removeEventListener(Event.ACTIVATE, stage_activateHandler);
			this._starling.start();
		}

		private function stage_resizeHandler(event : Event) : void
		{
			this._starling.stage.stageWidth = this.stage.stageWidth;
			this._starling.stage.stageHeight = this.stage.stageHeight;

			const viewPort:Rectangle = this._starling.viewPort;
			viewPort.width = this.stage.stageWidth;
			viewPort.height = this.stage.stageHeight;
			try
			{
				this._starling.viewPort = viewPort;
			}
			catch(error:Error) {}
		}
	}
}

