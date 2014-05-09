/**
 * Created by singuerinc on 09/05/2014.
 */
package models {
public class ImageModel {
  private var _alpha:Number;
  public function ImageModel() {

  }

  public function set alpha(value:Number):void {

    var newValue:Number = Math.max((value as Number), 0);
    newValue = Math.min(newValue, 1);

    this._alpha = newValue;
  }

  public function get alpha():Number {
    return this._alpha;
  }
}
}
