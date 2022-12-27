import "dart:developer";
import "dart:io";

import "package:flutter/material.dart";
import "package:upgrader/upgrader.dart";
import "package:upgrader_demo/singleton/navigation_singleton.dart";

class UpgraderSingleton {
  factory UpgraderSingleton() {
    return _singleton;
  }

  UpgraderSingleton._internal();
  static final UpgraderSingleton _singleton = UpgraderSingleton._internal();

  Future<void> initializeUpgrader() async {
    final bool isInitialized = await Upgrader.sharedInstance.initialize();
    log("Upgrader isInitialized: $isInitialized");
    return Future<void>.value();
  }

  Future<void> showUpgradeAlertDialog() async {
    final GlobalKey<NavigatorState> state = NavigationSingleton().navigatorKey;
    final BuildContext context = state.currentContext!;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return UpgradeAlert(
          upgrader: Upgrader(
            debugLogging: true,
            debugDisplayAlways: true,
            canDismissDialog: true,
            shouldPopScope: () {
              Upgrader.sharedInstance.popNavigator(context);
              Upgrader.sharedInstance.popNavigator(context);
              return true;
            },
            dialogStyle: Platform.isIOS
                ? UpgradeDialogStyle.cupertino
                : Platform.isAndroid
                    ? UpgradeDialogStyle.material
                    : UpgradeDialogStyle.material,
            onIgnore: () {
              Upgrader.sharedInstance.popNavigator(context);
              return true;
            },
            onLater: () {
              Upgrader.sharedInstance.popNavigator(context);
              return true;
            },
            onUpdate: () {
              Upgrader.sharedInstance.popNavigator(context);
              return true;
            },
          ),
        );
      },
    );
    return Future<void>.value();
  }
}
