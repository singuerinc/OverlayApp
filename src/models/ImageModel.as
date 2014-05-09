/**
 * Created by singuerinc on 09/05/2014.
 */
package models {
public class ImageModel {

  public static const INIT_ALPHA:Number = 0.8;

  private var _alpha:Number;
  private var _alwaysOnTop:Boolean;

  public function ImageModel() {
    _alpha = INIT_ALPHA;
    _alwaysOnTop = true;
  }

  public function set alpha(value:Number):void {

    var newValue:Number = Math.max(value, 0);
    newValue = Math.min(newValue, 1);

    this._alpha = newValue;
  }

  public function get alpha():Number {
    return this._alpha;
  }

  public function set alwaysOnTop(value:Boolean):void {
    this._alwaysOnTop = value;
  }

  public function get alwaysOnTop():Boolean {
    return this._alwaysOnTop;
  }
}
}
