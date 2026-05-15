import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veggicart/app/features/auth/data/models/user_model.dart';
import 'package:veggicart/app/features/auth/data/repositories/auth_repository.dart';

class AuthChangeProvider extends ChangeNotifier {
  AuthChangeProvider({
    required AuthRepository authRepo,
  }) : _authRepo = authRepo {
    _authRepo.authStateChanges.listen((e) async {
      if (e == null) {
        authUser = null;
        notifyListeners();
      } else {
        await getProfile(e.uid);
      }
    });
  }

  final AuthRepository _authRepo;

  User? authUser;
  UserModel? user;

  Future<void> getProfile(String id) async {
    final res = await _authRepo.getProfile(id);
  }
}
