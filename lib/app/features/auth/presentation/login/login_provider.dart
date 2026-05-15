import 'package:flutter/material.dart';
import 'package:veggicart/app/features/auth/data/repositories/auth_repository.dart';
import 'package:veggicart/app/features/auth/presentation/login/login_state.dart';

class LoginProvider extends ValueNotifier<LoginState> {
  LoginProvider({required AuthRepository authRepo})
    : _authRepo = authRepo,
      super(const LoginState());

  final AuthRepository _authRepo;
}
