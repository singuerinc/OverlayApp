/**
 * Created by singuerinc on 08/05/2014.
 */
package views {
import flash.display.NativeWindow;
import flash.display.NativeWindowInitOptions;
import flash.display.NativeWindowSystemChrome;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import org.as3commons.collections.SortedList;
import org.osflash.signals.natives.base.SignalSprite;

import views.buttons.AlwaysOnTopActionBtnView;
import views.buttons.InvertColorsActionBtnView;
import views.buttons.LockUnlockActionBtnView;
import views.buttons.RemoveImageViewActionBtnView;
import views.buttons.ShowHideActionBtnView;
import views.ui.BitmapImageView;
import views.ui.DropAreaView;
import views.ui.ImageAlphaDisplayView;
import views.ui.ScaleView;

public class ImageView extends SignalSprite {

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

    dropArea = new DropAreaView();
    dropArea.y = 25;
    addChild(dropArea);

    actionsContainer = new Sprite();
    actionsContainer.graphics.beginFill(0x000000);
    actionsContainer.graphics.drawRect(0, 0, 240, 20);
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

    imageAlphaDisplayView = new ImageAlphaDisplayView();
    imageAlphaDisplayView.x = 100;
    imageAlphaDisplayView.y = 5;
    imageAlphaDisplayView.visible = false;
    actionsContainer.addChild(imageAlphaDisplayView);

    scaleView = new ScaleView();
    scaleView.x = 125;
    scaleView.y = 5;
    scaleView.visible = false;
    actionsContainer.addChild(scaleView);

    notificationsContainer = new Sprite();
    addChild(notificationsContainer);
  }

  public var notifications:SortedList = new SortedList();
  public var notificationsContainer:Sprite;
  public var dropArea:DropAreaView;

  public var alwaysOnTopActionBtn:AlwaysOnTopActionBtnView;
  public var showHideActionBtn:ShowHideActionBtnView;
  public var lockUnlockActionBtn:LockUnlockActionBtnView;

  public var invertColorsActionBtn:InvertColorsActionBtnView;
  public var removeImageViewActionBtn:RemoveImageViewActionBtnView;
  public var imageAlphaDisplayView:ImageAlphaDisplayView;
  public var scaleView:ScaleView;

  public var actionsContainer:Sprite;
  private var _window:NativeWindow;

  private var INIT_WIDTH:int = 500;
  private var INIT_HEIGHT:int = 500 + 45;

  private var _bmp:BitmapImageView;

  public function get bmp():BitmapImageView {
    return _bmp;
  }

  public function set bmp(value:BitmapImageView):void {
    _bmp = value;
  }

}
}
