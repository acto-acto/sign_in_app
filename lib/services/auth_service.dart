import 'dart:async';
import '../models/user.dart';
import '../models/auth_result.dart';
import '../utils/exceptions.dart';

class AuthService {
  Future<AuthResult> signIn(String email, String password) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 3));

    try {
      if (email == 'test@example.com' && password == 'password123') {
        return AuthResult.success(
          User(id: '123', name: 'John Doe', email: email),
        );
      } else if (email == 'network@error.com') {
        throw NetworkException('Network connection failed');
      } else {
        return AuthResult.failure('Invalid email or password');
      }
    } catch (e) {
      if (e is NetworkException) {
        rethrow;
      }
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  Future<void> handlePostSignInOperations() async {
    final Completer<String> completer = Completer<String>();

    // Simulate some post-sign-in operations
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
