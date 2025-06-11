import 'dart:async';
import '../models/user.dart';
import '../models/auth_result.dart';

class AuthService {
  Future<AuthResult> signIn(String email, String password) async {
    await Future.delayed(Duration(seconds: 3));

    try {
      if (email == 'test@example.com' && password == 'password123') {
        return AuthResult.success(
          User(id: '123', name: 'John Doe', email: email),
        );
      } else {
        return AuthResult.failure('Invalid email or password');
      }
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  Future<void> handlePostSignInOperations() async {
    final Completer<String> completer = Completer();

    //@todo add some post-sign-in operations
    Timer(Duration(seconds: 1), () {
      completer.complete('User preferences loaded');
    });

    try {
      final result = await completer.future;
      print('Post sign-in operation completed: $result');
    } catch (e) {
      print('Post sign-in operation failed: $e');
    }
  }
}
