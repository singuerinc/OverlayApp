/**
 * Created by singuerinc on 09/05/2014.
 */
package models {
public class ImageModel {

  public static const INIT_ALPHA:Number = 1;
  public static const INIT_SCALE:Number = 1;

  private var _alpha:Number;
  private var _scale:Number;
  private var _alwaysOnTop:Boolean;
  private var _locked:Boolean;
  private var _visible:Boolean;
  private var _invertedColors:Boolean;
  private var _moved:Boolean;

  public function ImageModel() {
    _alpha = INIT_ALPHA;
    _scale = INIT_SCALE;
    _alwaysOnTop = true;
    _locked = false;
    _visible = true;
    _invertedColors = false;
  }

  public function set alpha(value:Number):void {

    var newValue:Number = Math.max(value, 0);
    newValue = Math.min(newValue, 1);

    this._alpha = newValue;
  }

  public function set scale(value:Number):void {

    var newValue:Number = Math.min(value, 3);
    newValue = Math.max(newValue, 0.5);

    this._scale = newValue;
  }

  public function get alpha():Number {
    return this._alpha;
  }

  public function get scale():Number {
    return this._scale;
  }

  public function set alwaysOnTop(value:Boolean):void {
    this._alwaysOnTop = value;
  }

  public function get alwaysOnTop():Boolean {
    return this._alwaysOnTop;
  }

  public function get locked():Boolean {
    return _locked;
  }

  public function set locked(value:Boolean):void {
    _locked = value;
  }

  public function get visible():Boolean {
    return _visible;
  }

  public function set visible(value:Boolean):void {
    _visible = value;
  }

  public function get invertedColors():Boolean {
    return _invertedColors;
  }

  public function set invertedColors(value:Boolean):void {
    _invertedColors = value;
  }

  public function set moved(moved:Boolean):void {
    _moved = moved;
  }

  public function get moved():Boolean {
    return _moved;
  }
}
}
