package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.geom.Point;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;

public class OverlayApp extends Sprite {

  private var _context:IContext;

  public function OverlayApp() {

    stage.scaleMode = StageScaleMode.NO_SCALE;
    stage.align = StageAlign.TOP_LEFT;

    stage.nativeWindow.minSize = new Point(0, 0);
    stage.frameRate = 60;

    _context = new Context()
        .install(MVCSBundle)
        .install(SignalCommandMapExtension)
        .configure(OverlayAppConfig)
        .configure(new ContextView(this));

    stage.stageFocusRect = false;
    stage.nativeWindow.activate();
  }
}
}
