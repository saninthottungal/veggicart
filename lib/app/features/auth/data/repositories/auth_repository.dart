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
    } on FirebaseAuthException catch (e) {
      return Failure(e.code, description: e.message);
    } catch (_) {
      return const Failure('Failed to signIn');
    }
  }

  Stream<User?> get authStateChanges => _remote.authStateChanges;

  Future<void> getProfile(String id) async {
    return _remote.getProfile(id);
  }
}
