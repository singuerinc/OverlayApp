/**
 * Created by singuerinc on 08/05/2014.
 */
package views {
import flash.desktop.Clipboard;
import flash.desktop.ClipboardFormats;
import flash.desktop.NativeDragActions;
import flash.desktop.NativeDragManager;
import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.NativeWindow;
import flash.display.NativeWindowInitOptions;
import flash.display.NativeWindowSystemChrome;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.NativeDragEvent;
import flash.filesystem.File;
import flash.net.URLRequest;
import flash.ui.Keyboard;

public class MainFrameView extends Sprite {

    private var _dropArea:DropArea;
    private var _image:Bitmap;
    private var _window:NativeWindow;

    public function MainFrameView() {

        super();

        var windowOptions:NativeWindowInitOptions = new NativeWindowInitOptions();

        windowOptions.systemChrome = NativeWindowSystemChrome.NONE;
        windowOptions.transparent = true;

        _window = new NativeWindow(windowOptions);

        addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
    }

    private function _onAddedToStage(event:Event):void {

        removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.stageFocusRect = false;


        _dropArea = new DropArea();
        addChild(_dropArea);

        stage.nativeWindow.addEventListener(Event.ACTIVATE, activateHandler, false, 0, true);
        stage.nativeWindow.addEventListener(Event.DEACTIVATE, deactivateHandler, false, 0, true);
        stage.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDownHandler, false, 0, true);

        stage.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, _onDragIn);
        stage.addEventListener(NativeDragEvent.NATIVE_DRAG_OVER, _onDragOver);
        stage.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, _onDrop);
        stage.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT, _onDragExit);

        stage.nativeWindow.activate();
        stage.nativeWindow.alwaysInFront = true;
    }

    protected function _mouseDownHandler(event:MouseEvent):void {
//        _maximized = false;

        stage.nativeWindow.startMove();
    }

    protected function activateHandler(event:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown, false, 0, true);
    }

    protected function deactivateHandler(event:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
    }

    private function _onKeyDown(event:KeyboardEvent):void {
        if (event.controlKey && !event.altKey) {
            switch (event.keyCode) {
                case Keyboard.LEFT:
//                    _maximized = false;
                    stage.nativeWindow.x -= (event.shiftKey) ? 10.0 : 1.0;
                    break;
                case Keyboard.RIGHT:
//                    _maximized = false;
                    stage.nativeWindow.x += (event.shiftKey) ? 10.0 : 1.0;
                    break;
                case Keyboard.UP:
//                    _maximized = false;
                    stage.nativeWindow.y -= (event.shiftKey) ? 10.0 : 1.0;
                    break;
                case Keyboard.DOWN:
//                    _maximized = false;
                    stage.nativeWindow.y += (event.shiftKey) ? 10.0 : 1.0;
                    break;
            }
        }

        if (_image) {
            if (!event.controlKey && !event.altKey) {
                switch (event.keyCode) {
                    case Keyboard.BACKSPACE:
                    case Keyboard.D:
                        if (_image) {
                            _image.parent.removeChild(_image);
                            _image = null;
                            _dropArea.visible = true;
                        }
                        break;
                    case Keyboard.NUMPAD_0:
                    case Keyboard.NUMBER_0:
                        _image.alpha = 1;
                        break;
                    case Keyboard.NUMBER_1:
                    case Keyboard.NUMBER_2:
                    case Keyboard.NUMBER_3:
                    case Keyboard.NUMBER_4:
                    case Keyboard.NUMBER_5:
                    case Keyboard.NUMBER_6:
                    case Keyboard.NUMBER_7:
                    case Keyboard.NUMBER_8:
                    case Keyboard.NUMBER_9:
                        _image.alpha = (event.keyCode - 48) * 0.1;
                        break;
                    case Keyboard.NUMPAD_1:
                    case Keyboard.NUMPAD_2:
                    case Keyboard.NUMPAD_3:
                    case Keyboard.NUMPAD_4:
                    case Keyboard.NUMPAD_5:
                    case Keyboard.NUMPAD_6:
                    case Keyboard.NUMPAD_7:
                    case Keyboard.NUMPAD_8:
                    case Keyboard.NUMPAD_9:
                        _image.alpha = (event.keyCode - 96) * 0.1;
                        break;
                    case Keyboard.NUMPAD_ADD:
                        _image.alpha += 0.1;
                        _image.alpha = Math.min(_image.alpha, 1);
                        break;
                    case Keyboard.NUMPAD_SUBTRACT:
                        _image.alpha -= 0.1;
                        _image.alpha = Math.max(_image.alpha, 0);
                        break;
                }
            }
        }
    }

    private function _onDragExit(event:NativeDragEvent):void {

    }

    private function _onDrop(event:NativeDragEvent):void {
        var clipboard:Clipboard = event.clipboard;
        if (clipboard.hasFormat(ClipboardFormats.FILE_LIST_FORMAT)) {
            var dropFiles:Array = clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
            var imageFile:File = dropFiles[0];
            var loader:Loader = new Loader();
            var urlReq:URLRequest = new URLRequest(imageFile.url);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onImageLoaded);
            loader.load(urlReq);
        }
    }

    private function _onImageLoaded(event:Event):void {
        _image = event.target.content as Bitmap;
//        var myImage:BitmapData = bmp.bitmapData;
//        trace(myImage.width, myImage.height);
        addChild(_image);

        _image.x = 0;
        _image.y = 0;

        _dropArea.visible = false;
    }

    private function _onDragOver(event:NativeDragEvent):void {

    }

    private function _onDragIn(event:NativeDragEvent):void {
        trace('drag', event);
        var transferable:Clipboard = event.clipboard;
        if (transferable.hasFormat(ClipboardFormats.BITMAP_FORMAT) ||
                transferable.hasFormat(ClipboardFormats.FILE_LIST_FORMAT) ||
                transferable.hasFormat(ClipboardFormats.URL_FORMAT)
                ) {
            NativeDragManager.dropAction = NativeDragActions.MOVE;
            NativeDragManager.acceptDragDrop(_dropArea);
        }
    }
}
}
