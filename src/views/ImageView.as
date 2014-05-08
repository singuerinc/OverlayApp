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
import flash.events.Event;
import flash.events.MouseEvent;

public class ImageView extends Sprite {

  private var _bmp:Bitmap;
  public var dropArea:DropArea;
  public var bmpContainer:Sprite;
  private var _window:NativeWindow;

  private var INIT_WIDTH:int = 500;
  private var INIT_HEIGHT:int = 500 + 30;
  public var alwaysOnTopActionBtn:ActionButtonView;
  public var showHideActionBtn:ActionButtonView;
  public var invertColorsActionBtn:ActionButtonView;
  public var moveActionBtn:ActionButtonView;

  public function ImageView() {

    super();

    trace('hola!');

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
    dropArea.y = 15;
    addChild(dropArea);

    bmpContainer = new Sprite();
    bmpContainer.mouseEnabled = false;
    bmpContainer.mouseChildren = false;
    bmpContainer.y = 15;
    addChild(bmpContainer);

    alwaysOnTopActionBtn = new ActionButtonView('T', 0x999999, OverlayEvent.IMAGE_ALWAYS_ON_TOP);
    alwaysOnTopActionBtn.x = 0;
    alwaysOnTopActionBtn.y = 0;
    addChild(alwaysOnTopActionBtn);

    showHideActionBtn = new ActionButtonView('H', 0x009900, OverlayEvent.IMAGE_SHOW_HIDE);
    showHideActionBtn.x = 15;
    showHideActionBtn.y = 0;
    addChild(showHideActionBtn);

    invertColorsActionBtn = new ActionButtonView('I', 0xFFFFFF, OverlayEvent.IMAGE_INVERT_COLORS);
    invertColorsActionBtn.x = 30;
    invertColorsActionBtn.y = 0;
    addChild(invertColorsActionBtn);

    moveActionBtn = new ActionButtonView('M', 0x119999, null);
    moveActionBtn.x = 60;
    moveActionBtn.y = 0;
    addChild(moveActionBtn);
  }

  public function setBitmap(bmp:Bitmap):void {

    try {
      bmpContainer.removeChild(_bmp);
    } catch (e:Error) {

    } finally {
      _bmp = bmp;
      _bmp.alpha = 1;
      _bmp.visible = false;
      bmpContainer.addChild(_bmp);
    }

    stage.stageWidth = _bmp.width;
    stage.stageHeight = _bmp.height + 30;

    TweenMax.to(dropArea, .4, {autoAlpha: 0, delay: .2});
    TweenMax.to(_bmp, .4, {autoAlpha: 1, delay: .2});
  }

  public function removeBitmap():void {
    try {
      bmpContainer.removeChild(_bmp);
    } catch (e:Error) {

    } finally {

      stage.stageWidth = INIT_WIDTH;
      stage.stageHeight = INIT_HEIGHT;

      TweenMax.to(dropArea, .4, {autoAlpha: 0.5});
    }
  }

  public function get bmp():Bitmap {
    return _bmp;
  }
}
}
