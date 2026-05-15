import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:veggicart/app/features/auth/presentation/login/login_page.dart';
import 'package:veggicart/app/features/auth/presentation/login/login_provider.dart';
import 'package:veggicart/app/features/auth/presentation/splash/splash_page.dart';
import 'package:veggicart/app/features/auth/presentation/splash/splash_provider.dart';

part 'app_routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(authRepository: context.read()),
      child: const SplashPage(),
    );
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(authRepo: context.read()),
      child: const LoginPage(),
    );
  }
}
