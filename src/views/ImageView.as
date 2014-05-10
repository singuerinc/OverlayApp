/**
 * Created by singuerinc on 08/05/2014.
 */
package views {
import com.greensock.TweenMax;

import flash.display.Bitmap;
import flash.display.NativeWindow;
import flash.display.NativeWindowInitOptions;
import flash.display.NativeWindowSystemChrome;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import views.buttons.AlwaysOnTopActionBtnView;
import views.buttons.InvertColorsActionBtnView;
import views.buttons.LockUnlockActionBtnView;
import views.buttons.RemoveImageViewActionBtnView;
import views.buttons.ShowHideActionBtnView;

public class ImageView extends Sprite {

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

    dropArea = new DropArea();
    dropArea.y = 25;
    addChild(dropArea);

    bmpContainer = new Sprite();
    bmpContainer.mouseEnabled = false;
    bmpContainer.mouseChildren = false;
    bmpContainer.y = 25;
    addChild(bmpContainer);

    actionsContainer = new Sprite();
    actionsContainer.graphics.beginFill(0x000000);
    actionsContainer.graphics.drawRect(0, 0, 100, 20);
    actionsContainer.graphics.endFill();
    addChild(actionsContainer);

    alwaysOnTopActionBtn = new AlwaysOnTopActionBtnView();
    alwaysOnTopActionBtn.x = 5;
    alwaysOnTopActionBtn.y = 5;
    actionsContainer.addChild(alwaysOnTopActionBtn);

    lockUnlockActionBtn = new LockUnlockActionBtnView();
    lockUnlockActionBtn.x = 20;
    lockUnlockActionBtn.y = 5;
    actionsContainer.addChild(lockUnlockActionBtn);

    showHideActionBtn = new ShowHideActionBtnView();
    showHideActionBtn.x = 35;
    showHideActionBtn.y = 5;
    actionsContainer.addChild(showHideActionBtn);

    invertColorsActionBtn = new InvertColorsActionBtnView();
    invertColorsActionBtn.x = 70;
    invertColorsActionBtn.y = 5;
    invertColorsActionBtn.visible = false;
    actionsContainer.addChild(invertColorsActionBtn);

    removeImageViewActionBtn = new RemoveImageViewActionBtnView();
    removeImageViewActionBtn.x = 85;
    removeImageViewActionBtn.y = 5;
    removeImageViewActionBtn.visible = false;
    actionsContainer.addChild(removeImageViewActionBtn);
  }

  public var dropArea:DropArea;
  public var bmpContainer:Sprite;
  public var alwaysOnTopActionBtn:AlwaysOnTopActionBtnView;
  public var showHideActionBtn:ShowHideActionBtnView;
  public var lockUnlockActionBtn:LockUnlockActionBtnView;
  public var invertColorsActionBtn:InvertColorsActionBtnView;
  public var removeImageViewActionBtn:RemoveImageViewActionBtnView;
  public var actionsContainer:Sprite;
  private var _window:NativeWindow;
  private var INIT_WIDTH:int = 500;
  private var INIT_HEIGHT:int = 500 + 45;

  private var _bmp:Bitmap;

  public function set bmp(value:Bitmap):void {
    _bmp = value;
  }

  public function get bmp():Bitmap {
    return _bmp;
  }

}
}
