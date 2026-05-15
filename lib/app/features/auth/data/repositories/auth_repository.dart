import 'package:firebase_auth/firebase_auth.dart';
import 'package:veggicart/app/core/data/result.dart';
import 'package:veggicart/app/features/auth/data/sources/auth_remote_data_source.dart';

class AuthRepository {
  AuthRepository({
    required AuthRemoteDataSource remote,
  }) : _remote = remote;

  final AuthRemoteDataSource _remote;

  Future<Result<User, String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _remote.signIn(
        email: email,
        password: password,
      );

      if (res.user case final user?) {
        return Success(user);
      } else {
        return const Failure('Failed to signIn');
      }
    } catch (_) {
      return const Failure('Failed to signIn');
    }
  }
}
