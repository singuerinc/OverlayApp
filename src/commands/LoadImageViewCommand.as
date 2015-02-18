/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.filesystem.File;
import flash.net.URLRequest;

import models.ImageModel;
import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

import signals.ChangeAlphaSignal;
import signals.ChangeScaleSignal;

import signals.DisplayNotificationSignal;
import signals.LoadImageViewSignal;
import signals.RemoveImageViewSignal;

import views.ImageView;
import views.ui.BitmapImageView;

public class LoadImageViewCommand extends Command {

  [Inject]
  public var mediatorMap:IMediatorMap;

  [Inject]
  public var signal:LoadImageViewSignal;
  [Inject]
  public var notificationSignal:DisplayNotificationSignal;
  [Inject]
  public var removeImageViewSignal:RemoveImageViewSignal;
  [Inject]
  public var changeAlphaSignal:ChangeAlphaSignal;
  [Inject]
  public var changeScaleSignal:ChangeScaleSignal;

  [Inject]
  public var model:ImagesMap;

  private var _file:File;

  override public function execute():void {

    _file = signal.file;

    //TODO: catch errors?
    var loader:Loader = new Loader();
    var urlReq:URLRequest = new URLRequest(signal.file.url);
    loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onImageLoaded);
    loader.load(urlReq);
  }

  private function _addBitmap(view:ImageView, bmp:Bitmap):void {
    var model:ImageModel = model.itemFor(view);

    view.invertColorsActionBtn.visible = true;
    view.removeImageViewActionBtn.visible = true;
    view.imageAlphaDisplayView.visible = true;
    view.scaleView.visible = true;

    view.bmp = new BitmapImageView(bmp);
    view.bmp.y = 25;
    view.addChildAt(view.bmp, 0);

    mediatorMap.mediate(view.bmp);
    mediatorMap.mediate(view.bmp.guides);

    view.stage.stageWidth = view.bmp.width;
    view.stage.stageHeight = view.bmp.height + 45;

    changeAlphaSignal.dispatch(ImageModel.INIT_ALPHA);
    changeScaleSignal.dispatch(ImageModel.INIT_SCALE);

    view.dropArea.visible = false;

    notificationSignal.dispatch('Image loaded: ' + _file.name, null);
  }

  private function _onImageLoaded(event:Event):void {

    var view:ImageView = model.current;
    var bmp:Bitmap = event.target.content as Bitmap;

    if (view.bmp) {
      removeImageViewSignal.dispatch();
    }
    _addBitmap(view, bmp);
  }
}
}