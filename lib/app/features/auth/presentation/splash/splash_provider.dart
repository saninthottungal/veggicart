import 'package:flutter/material.dart';
import 'package:veggicart/app/features/auth/data/repositories/auth_repository.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider({required AuthRepository authRepository})
    : _authRepo = authRepository;

  final AuthRepository _authRepo;
}
