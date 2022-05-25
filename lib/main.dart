import 'package:flutter/material.dart';
import 'package:myfl/model/app_state_manager.dart';
import 'package:myfl/model/station_manger.dart';
import 'package:myfl/view/station_screen.dart';
import 'package:provider/provider.dart';

import 'navigation/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateManager = AppStateManager();
  final _stationManager = StationManager();
  late AppRouter _appRouter;
  @override
  void initState() {
    _appRouter = AppRouter(
        appStateManager: _appStateManager, stationManager: _stationManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _stationManager,
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'DerashApp',
        home: Router(
          routerDelegate: _appRouter,
// TODO: Add backButtonDispatcher
        ),
      ),
    );
  }
}
