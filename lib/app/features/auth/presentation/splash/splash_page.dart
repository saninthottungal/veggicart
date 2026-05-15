import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:veggicart/app/core/router/app_routes.dart';
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

    Future.delayed(const Duration(seconds: 2), () {
      final ctx = context;
      if (!ctx.mounted) return;

      const LoginRoute().go(ctx);
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

              Assets.logos.splashLogo.image(
                height: 97,
                width: 300,
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
