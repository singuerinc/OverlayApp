/**
 * Created by singuerinc on 09/05/2014.
 */
package mediators {
import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Mediator;

import signals.ChangeScaleSignal;

import views.ImageView;
import views.ui.ScaleView;

public class ScaleViewMediator extends Mediator {

    [Inject]
    public var view:ScaleView;

    [Inject]
    public var changeScaleSignal:ChangeScaleSignal;

    [Inject]
    public var model:ImagesMap;

    override public function initialize():void {
        changeScaleSignal.addWithPriority(_onScaleChanged, -1);
    }

    private function _onScaleChanged(scale:Number):void {

        var imageView:ImageView = model.current;
        var model:ImageModel = model.itemFor(imageView);

        var scale:Number = model.scale;
        view.update(scale);
    }
}
}
