import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:veggicart/app/core/router/app_router.dart';
import 'package:veggicart/app/features/auth/data/repositories/auth_repository.dart';
import 'package:veggicart/app/features/auth/data/sources/auth_remote_data_source.dart';
import 'package:veggicart/firebase_options.dart';

final talker = TalkerFlutter.init();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    talker.error(details.exceptionAsString(), details.stack);
  };

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthRepository(
            remote: AuthRemoteDataSource(
              auth: FirebaseAuth.instance,
              db: FirebaseFirestore.instance,
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'Veggicart',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
