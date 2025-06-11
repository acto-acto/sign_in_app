import 'user.dart';

class AuthResult {
  final bool isSuccess;
  final User? user;
  final String? errorMessage;

  AuthResult._({required this.isSuccess, this.user, this.errorMessage});

  factory AuthResult.success(User user) {
    return AuthResult._(isSuccess: true, user: user);
  }

  factory AuthResult.failure(String errorMessage) {
    return AuthResult._(isSuccess: false, errorMessage: errorMessage);
  }

  @override
  String toString() {
    return 'AuthResult{isSuccess: $isSuccess, user: $user, errorMessage: $errorMessage}';
  }
}
