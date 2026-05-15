import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:veggicart/app/features/admin/presentation/bottom_nav/bottom_nav_page.dart';
import 'package:veggicart/app/features/admin/presentation/dashboard/dashboard_page.dart';
import 'package:veggicart/app/features/admin/presentation/orders/orders_page.dart';
import 'package:veggicart/app/features/admin/presentation/vegetables/vegetables_page.dart';
import 'package:veggicart/app/features/auth/presentation/login/login_page.dart';
import 'package:veggicart/app/features/auth/presentation/login/login_provider.dart';
import 'package:veggicart/app/features/auth/presentation/splash/splash_page.dart';
import 'package:veggicart/app/features/auth/presentation/splash/splash_provider.dart';
import 'package:veggicart/app/features/profile/presentation/profile_page/profile_page.dart';

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

@TypedGoRoute<ProfileRoute>(path: '/profiles/:id')
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute(this.id);

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

@TypedStatefulShellRoute<AdminShellRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DashboardRoute>(path: '/dashboard'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<VegetablesRoute>(path: '/vegetables'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<OrdersRoute>(path: '/orders'),
      ],
    ),
  ],
)
class AdminShellRoute extends StatefulShellRouteData {
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AdminBottomNav(
      navigationShell: navigationShell,
    );
  }
}

class DashboardRoute extends GoRouteData with $DashboardRoute {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardPage();
  }
}

class VegetablesRoute extends GoRouteData with $VegetablesRoute {
  const VegetablesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const VegetablesPage();
  }
}

class OrdersRoute extends GoRouteData with $OrdersRoute {
  const OrdersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OrdersPage();
  }
}
