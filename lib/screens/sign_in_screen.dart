import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/status_message.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String _statusMessage = '';
  Color _statusColor = Colors.black;

  Future<void> _handleSignIn(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      _updateStatus('Please fill in all fields', Colors.red);
      return;
    }

    setState(() {
      _isLoading = true;
      _statusMessage = 'Signing in...';
      _statusColor = Colors.blue;
    });

    try {
      final result = await _authService.signIn(email.trim(), password.trim());

      if (result.isSuccess) {
        _updateStatus(
          'Sign-in successful! Welcome, ${result.user?.name}',
          Colors.green,
        );
        await _authService.handlePostSignInOperations();
      } else {
        _updateStatus('Sign-in failed: ${result.errorMessage}', Colors.red);
      }
    } catch (e) {
      _updateStatus('Unexpected error: ${e.toString()}', Colors.red);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _updateStatus(String message, Color color) {
    setState(() {
      _statusMessage = message;
      _statusColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async Sign-In Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 32),

            SignInForm(onSignIn: _handleSignIn, isLoading: _isLoading),

            SizedBox(height: 16),

            StatusMessage(message: _statusMessage, color: _statusColor),

            SizedBox(height: 24),
            Text(
              'Demo credentials:\n'
              'Success: test@example.com / password123\n'
              'Failure: Any other combination',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
