import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_pop_sample/core/ui/app_theme.dart';
import 'package:pop_pop_sample/pages/game.dart';
import 'package:pop_pop_sample/pages/menu.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _router;

  @override
  void initState() {
    _router = GoRouter(
      urlPathStrategy: UrlPathStrategy.path,
      observers: [SentryNavigatorObserver()],
      routes: [
        GoRoute(
          path: Menu.routePath,
          name: Menu.routeName,
          builder: (_, __) => const Menu(),
          routes: [
            GoRoute(
              path: Game.routePath,
              name: Game.routeName,
              builder: (_, __) => const Game(),
            ),
          ],
        ),
      ],
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
      );
}
