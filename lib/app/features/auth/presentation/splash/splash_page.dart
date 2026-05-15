import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:provider/provider.dart';
import 'package:veggicart/app/core/data/result.dart';
import 'package:veggicart/app/core/router/app_routes.dart';
import 'package:veggicart/app/features/auth/presentation/splash/splash_provider.dart';
import 'package:veggicart/gen/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    final pod = context.read<SplashProvider>();
    pod.getProfile().then((res) {
      final ctx = context;
      if (!ctx.mounted) return;

      if (res case Success(:final value)) {
      } else {
        const LoginRoute().go(ctx);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .all(context.gutter),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .stretch,
            children: [
              const Spacer(),

              Hero(
                tag: 'logo-splash-login',
                child: Assets.logos.splashLogo.image(
                  height: 97,
                  width: 300,
                ),
              ),

              const Spacer(),

              const FractionallySizedBox(
                widthFactor: 0.4,
                child: LinearProgressIndicator(minHeight: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
