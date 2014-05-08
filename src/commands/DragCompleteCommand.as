/**
 * Created by singuerinc on 08/05/2014.
 */
package commands {
import flash.events.NativeDragEvent;

import robotlegs.bender.bundles.mvcs.Command;

public class DragCompleteCommand extends Command {

    [Inject]
    public var event:NativeDragEvent;

    override public function execute():void {
        super.execute();
        trace(event);
    }
}
}
