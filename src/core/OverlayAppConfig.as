/**
 * Created by singuerinc on 08/05/2014.
 */
package core {
import com.google.analytics.GATracker;
import com.google.analytics.debug.DebugConfiguration;

import commands.CopyHexColorCommand;
import commands.CopyLocationCommand;
import commands.CreateImageViewCommand;
import commands.DisplayNotificationCommand;
import commands.ImageAlwaysOnTopCommand;
import commands.ImageChangeAlphaCommand;
import commands.ImageInvertColorsCommand;
import commands.ImageLockUnlockCommand;
import commands.ImageShowHideCommand;
import commands.LoadImageViewCommand;
import commands.MoveWindowCommand;
import commands.RemoveImageViewCommand;
import commands.StartupCommand;

import mediators.BitmapImageViewMediator;
import mediators.GuidesViewMediator;
import mediators.ImageAlphaDisplayViewMediator;
import mediators.ImageViewMediator;
import mediators.MainFrameViewMediator;

import models.ImagesMap;
import models.UserModel;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import services.AppUpdaterService;

import signals.AlwaysOnTopSignal;
import signals.ChangeAlphaSignal;
import signals.CopyHexColorSignal;
import signals.CopyLocationSignal;
import signals.CreateImageViewSignal;
import signals.DisplayNotificationSignal;
import signals.InvertColorsSignal;
import signals.LoadImageViewSignal;
import signals.LockOrUnlockSignal;
import signals.MoveWindowSignal;
import signals.RemoveImageViewSignal;
import signals.ShowHideSignal;
import signals.StartupSignal;
import signals.StartupSignal;

import views.ImageView;
import views.MainFrameView;
import views.buttons.AlwaysOnTopActionBtnMediator;
import views.buttons.AlwaysOnTopActionBtnView;
import views.buttons.InvertColorsActionBtnMediator;
import views.buttons.InvertColorsActionBtnView;
import views.buttons.LockUnlockActionBtnMediator;
import views.buttons.LockUnlockActionBtnView;
import views.buttons.RemoveImageViewActionBtnMediator;
import views.buttons.RemoveImageViewActionBtnView;
import views.buttons.ShowHideActionBtnMediator;
import views.buttons.ShowHideActionBtnView;
import views.ui.BitmapImageView;
import views.ui.GuidesView;
import views.ui.ImageAlphaDisplayView;

public class OverlayAppConfig implements IConfig {
  [Inject]
  public var injector:IInjector;

  [Inject]
  public var mediatorMap:IMediatorMap;

  [Inject]
  public var commandMap:IEventCommandMap;

  [Inject]
  public var signalCommandMap:ISignalCommandMap;

  [Inject]
  public var contextView:ContextView;

  public function configure():void {

    injector.map(GATracker).toValue(new GATracker(contextView.view, Settings.GA_ACCOUNT, "AS3"));
    injector.map(AppUpdaterService).asSingleton();

    injector.map(UserModel).asSingleton();
    injector.map(ImagesMap).asSingleton();

    mediatorMap.map(ImageView).toMediator(ImageViewMediator);
    mediatorMap.map(MainFrameView).toMediator(MainFrameViewMediator);

    //top bar buttons
    mediatorMap.map(AlwaysOnTopActionBtnView).toMediator(AlwaysOnTopActionBtnMediator);
    mediatorMap.map(LockUnlockActionBtnView).toMediator(LockUnlockActionBtnMediator);
    mediatorMap.map(ShowHideActionBtnView).toMediator(ShowHideActionBtnMediator);
    mediatorMap.map(InvertColorsActionBtnView).toMediator(InvertColorsActionBtnMediator);
    mediatorMap.map(RemoveImageViewActionBtnView).toMediator(RemoveImageViewActionBtnMediator);
    mediatorMap.map(BitmapImageView).toMediator(BitmapImageViewMediator);
    mediatorMap.map(GuidesView).toMediator(GuidesViewMediator);
    mediatorMap.map(ImageAlphaDisplayView).toMediator(ImageAlphaDisplayViewMediator);

    signalCommandMap.map(CreateImageViewSignal).toCommand(CreateImageViewCommand);
    signalCommandMap.map(AlwaysOnTopSignal).toCommand(ImageAlwaysOnTopCommand);
    signalCommandMap.map(LockOrUnlockSignal).toCommand(ImageLockUnlockCommand);
    signalCommandMap.map(ChangeAlphaSignal).toCommand(ImageChangeAlphaCommand);
    signalCommandMap.map(ShowHideSignal).toCommand(ImageShowHideCommand);
    signalCommandMap.map(InvertColorsSignal).toCommand(ImageInvertColorsCommand);
    signalCommandMap.map(LoadImageViewSignal).toCommand(LoadImageViewCommand);
    signalCommandMap.map(RemoveImageViewSignal).toCommand(RemoveImageViewCommand);
    signalCommandMap.map(CopyHexColorSignal).toCommand(CopyHexColorCommand);
    signalCommandMap.map(DisplayNotificationSignal).toCommand(DisplayNotificationCommand);
    signalCommandMap.map(CopyLocationSignal).toCommand(CopyLocationCommand);
    signalCommandMap.map(MoveWindowSignal).toCommand(MoveWindowCommand);

    signalCommandMap.map(StartupSignal).toCommand(StartupCommand);
    injector.getInstance(StartupSignal).dispatch();
  }
}
}
