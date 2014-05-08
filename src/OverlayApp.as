package {

import flash.display.Sprite;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.api.IContext;

import robotlegs.bender.framework.impl.Context;

public class OverlayApp extends Sprite {

    private var _context:IContext;

    public function OverlayApp() {
        _context = new Context()
                .install(MVCSBundle)
                .configure(OverlayAppConfig)
                .configure(new ContextView(this));
    }
}
}
