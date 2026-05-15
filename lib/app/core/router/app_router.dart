import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:veggicart/app/core/router/app_routes.dart';
import 'package:veggicart/main.dart';

final appRouter = GoRouter(
  initialLocation: const SplashRoute().location,
  routes: $appRoutes,
  debugLogDiagnostics: true,
  observers: [
    TalkerRouteObserver(talker),
  ],
);
