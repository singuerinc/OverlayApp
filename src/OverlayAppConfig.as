/**
 * Created by singuerinc on 08/05/2014.
 */
package {
import commands.CreateImageViewCommand;
import commands.DragCompleteCommand;

import flash.events.KeyboardEvent;

import mediators.ImageViewMediator;

import mediators.MainFrameMediator;

import flash.events.MouseEvent;
import flash.events.NativeDragEvent;

import models.UserModel;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import views.ImageView;

import views.MainFrameView;
import views.OverlayEvent;

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
            mediatorMap.map(ImageView).toMediator(ImageViewMediator);

            commandMap.map(KeyboardEvent.KEY_DOWN).toCommand(DragCompleteCommand);
            commandMap.map(OverlayEvent.CREATE_IMAGE_VIEW).toCommand(CreateImageViewCommand);

            contextView.view.addChild(new MainFrameView());

        }
    }
}
