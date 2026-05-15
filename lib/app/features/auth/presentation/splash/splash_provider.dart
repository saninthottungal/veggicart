import 'package:flutter/material.dart';
import 'package:veggicart/app/features/auth/data/repositories/auth_repository.dart';
import 'package:veggicart/app/features/auth/presentation/splash/splash_state.dart';

class SplashProvider extends ValueNotifier<SplashState> {
  SplashProvider({required AuthRepository authRepository})
    : _authRepo = authRepository,
      super(const SplashState());

  final AuthRepository _authRepo;
}
