/**
 * Created by singuerinc on 08/05/2014.
 */
package {
import commands.DragCompleteCommand;

import mediators.MainFrameMediator;

import flash.events.MouseEvent;
import flash.events.NativeDragEvent;

import models.UserModel;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import views.MainFrameView;

public class OverlayAppConfig implements IConfig
    {
        [Inject]
        public var injector:IInjector;

        [Inject]
        public var mediatorMap:IMediatorMap;

        [Inject]
        public var commandMap:IEventCommandMap;

        [Inject]
        public var contextView:ContextView;

        public function configure():void
        {
            injector.map(UserModel).asSingleton();

            mediatorMap.map(MainFrameView).toMediator(MainFrameMediator);

//            commandMap.map(NativeDragEvent.NATIVE_DRAG_COMPLETE).toCommand(DragCompleteCommand);

            contextView.view.addChild(new MainFrameView());
        }
    }
}
