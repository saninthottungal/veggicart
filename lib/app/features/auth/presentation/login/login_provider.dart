import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veggicart/app/core/data/result.dart';
import 'package:veggicart/app/features/auth/data/repositories/auth_repository.dart';
import 'package:veggicart/app/features/auth/presentation/login/login_state.dart';

class LoginProvider extends ValueNotifier<LoginState> {
  LoginProvider({required AuthRepository authRepo})
    : _authRepo = authRepo,
      super(const LoginState());

  final AuthRepository _authRepo;

  Future<Result<User, String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      value = value.copyWith(isProcessing: true);

      return await _authRepo.signIn(
        email: email,
        password: password,
      );
    } finally {
      value = value.copyWith(isProcessing: false);
    }
  }
}
