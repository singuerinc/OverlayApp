/**
 * Created by singuerinc on 08/05/2014.
 */
package views {
import com.greensock.TweenMax;
import com.greensock.easing.Quad;

import flash.display.Bitmap;
import flash.display.NativeWindow;
import flash.display.NativeWindowInitOptions;
import flash.display.NativeWindowSystemChrome;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

public class ImageView extends Sprite {

  private var _bmp:Bitmap;
  public var dropArea:DropArea;
  private var _window:NativeWindow;

  private var INIT_WIDTH:int = 500;
  private var INIT_HEIGHT:int = 500;

  public function ImageView() {

    super();

    var windowOptions:NativeWindowInitOptions = new NativeWindowInitOptions();

    windowOptions.systemChrome = NativeWindowSystemChrome.NONE;
    windowOptions.transparent = true;

    _window = new NativeWindow(windowOptions);

    _window.stage.addChild(this);
    _window.stage.frameRate = 60;

    _window.stage.scaleMode = StageScaleMode.NO_SCALE;
    _window.stage.align = StageAlign.TOP_LEFT;

    stage.stageWidth = INIT_WIDTH;
    stage.stageHeight = INIT_HEIGHT;

    stage.nativeWindow.activate();
    stage.nativeWindow.alwaysInFront = true;

    dropArea = new DropArea(INIT_WIDTH, INIT_HEIGHT);
    addChild(dropArea);

  }

  public function setBitmap(bmp:Bitmap):void {

    try {
      removeChild(_bmp);
    } catch (e:Error) {

    } finally {
      _bmp = bmp;
      _bmp.alpha = 1;
      _bmp.visible = false;
      addChild(_bmp);
    }

    stage.stageWidth = _bmp.width;
    stage.stageHeight = _bmp.height;

    TweenMax.to(dropArea, .4, {autoAlpha: 0, delay: .2});
    TweenMax.to(_bmp, .4, {autoAlpha: 1, delay: .2});
  }

  public function removeBitmap():void {
    try {
      removeChild(_bmp);
    } catch (e:Error) {

    } finally {

      stage.stageWidth = INIT_WIDTH;
      stage.stageHeight = INIT_HEIGHT;

      TweenMax.to(dropArea, .4, {autoAlpha: 0.5});
    }
  }
}
}
