import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../features/about/about.dart';
import '../../../features/auth/auth.dart';
import '../../../features/home/home.dart';
import '../../../features/magic/domain/model/card_model.dart';
import '../../../features/magic/magic.dart';
import '../../../features/splash/splash.dart';

abstract class NavigationRoutes {
  // Route paths (for subroutes) - private access
  static const String _magicDetailPath = 'detail';

  // Route names
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String magicRoute = '/magic';
  static const String artistDetailRoute = '$magicRoute/$_magicDetailPath';
  static const String aboutRoute = '/about';
}

// Nav keys
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _artistsNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _aboutNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: NavigationRoutes.initialRoute,
  routes: [
    // Routes
    GoRoute(
      path: NavigationRoutes.initialRoute,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => HomeScreen(navigationShell: shell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _artistsNavigatorKey,
          routes: [
            GoRoute(
              path: NavigationRoutes.magicRoute,
              parentNavigatorKey: _artistsNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: MagicListScreen()),
              routes: [
                GoRoute(
                  path: NavigationRoutes._magicDetailPath,
                  builder: (context, state) {
                    final extra = state.extra! as Map<String, dynamic>;
                    return MagicDetailScreen(card: Cards.fromJson(extra));
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _aboutNavigatorKey,
          routes: [
            GoRoute(
              path: NavigationRoutes.aboutRoute,
              parentNavigatorKey: _aboutNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: AboutScreen()),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: NavigationRoutes.loginRoute,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
