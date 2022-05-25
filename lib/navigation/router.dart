import 'package:flutter/material.dart';
import 'package:myfl/model/app_state_manager.dart';
import 'package:myfl/model/station_manger.dart';
import 'package:myfl/view/station_screen.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final AppStateManager appStateManager;
  final StationManager stationManager;
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  AppRouter({required this.appStateManager, required this.stationManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    stationManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    stationManager.addListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (appStateManager.isLoggedIn && stationManager.stations != null)
          StationScreen.page(stationManager.stations!),
      ],
      onPopPage: _handlePopPage,
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;

  bool _handlePopPage(
// 1
      Route<dynamic> route,
// 2
      result) {
// 3
    if (!route.didPop(result)) {
// 4
      return false;
    }
    return true;
  }
}
