import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../features/pages.dart';
import '../models/models.dart';
import '../services/services.dart';

class AppRoutes {
  static final GoRouter _router = GoRouter(
    initialLocation: SplashscreenPage.route,
    observers: [TalkerRouteObserver(LoggerService.talker)],
    routes: [
      GoRoute(
        name: SplashscreenPage.route,
        path: SplashscreenPage.route,
        builder: (context, state) => const SplashscreenPage(),
      ),
      GoRoute(
        name: IntroPage.route,
        path: IntroPage.route,
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        name: MainPage.route,
        path: MainPage.route,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        name: UserPage.route,
        path: UserPage.route,
        builder: (context, state) {
          final user = state.extra as User;
          return UserPage(user: user);
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
