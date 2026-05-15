class AuthRepository {
  AuthRepository({
    required AuthRepository authRepo,
  }) : _authRepo = authRepo;

  final AuthRepository _authRepo;
}
