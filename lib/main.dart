import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:veggicart/app/core/router/app_router.dart';

final talker = TalkerFlutter.init();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    talker.error(details.exceptionAsString(), details.stack);
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Veggicart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
