import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({
    required FirebaseAuth auth,
    required FirebaseFirestore db,
  }) : _db = db,
       _auth = auth;

  final FirebaseAuth _auth;
  final FirebaseFirestore _db;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    final res = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return res;
  }

  Future<void> signOut() => _auth.signOut();

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> getProfile(String id) async {
    final data = (await _db.collection('profiles').doc(id).get()).data();
    if (data == null) {
      throw Exception('User not found');
    }

    print(data);
  }
}
