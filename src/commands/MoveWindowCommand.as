/**
 * Created by singuerinc on 10/05/2014.
 */
package commands {
import flash.display.NativeWindow;

import models.ImagesMap;

import robotlegs.bender.bundles.mvcs.Command;

import signals.MoveWindowSignal;

import views.ImageView;

public class MoveWindowCommand extends Command {

  [Inject]
  public var signal:MoveWindowSignal;
  [Inject]
  public var map:ImagesMap;

  override public function execute():void {

    var nw:NativeWindow = (map.current as ImageView).stage.nativeWindow;
    nw.x += signal.point.x;
    nw.y += signal.point.y;

  }
}
}