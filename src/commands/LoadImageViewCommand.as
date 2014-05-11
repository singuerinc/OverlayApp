/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import com.greensock.TweenMax;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import models.ImageModel;
import models.ImageModelCollection;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

import signals.DisplayNotificationSignal;
import signals.LoadImageViewSignal;
import signals.RemoveImageViewSignal;

import views.BitmapImageView;
import views.ImageView;
import views.ui.ColorNotificationIcon;

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
  public var model:ImageModelCollection;

  private var _url:String;

  override public function execute():void {

    _url = signal.url;

    //TODO: catch errors?
    var loader:Loader = new Loader();
    var urlReq:URLRequest = new URLRequest(signal.url);
    loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onImageLoaded);
    loader.load(urlReq);
  }

  private function _onImageLoaded(event:Event):void {

    removeImageViewSignal.dispatch();

    var view:ImageView = model.currentImage;
    var model:ImageModel = model.itemFor(view);

    view.invertColorsActionBtn.visible = true;
    view.removeImageViewActionBtn.visible = true;

    model.alpha = ImageModel.INIT_ALPHA;

    view.bmp = new BitmapImageView(event.target.content as Bitmap);
    view.bmp.y = 25;
    view.addChildAt(view.bmp, 0);

    mediatorMap.mediate(view.bmp);

    view.stage.stageWidth = view.bmp.width;
    view.stage.stageHeight = view.bmp.height + 45;

    TweenMax.to(view.dropArea, .4, {autoAlpha: 0, delay: .2});
    TweenMax.to(view.bmp, 1, {autoAlpha: model.alpha, delay: .2});

    notificationSignal.dispatch('Image loaded: ' + _url, null);
  }
}
}