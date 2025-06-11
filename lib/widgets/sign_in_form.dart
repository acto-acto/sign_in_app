import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  final Function(String email, String password) onSignIn;
  final bool isLoading;

  const SignInForm({Key? key, required this.onSignIn, required this.isLoading})
    : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    widget.onSignIn(_emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
          keyboardType: TextInputType.emailAddress,
          enabled: !widget.isLoading,
        ),
        SizedBox(height: 16),

        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
          enabled: !widget.isLoading,
        ),
        SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : _handleSubmit,
            child: widget.isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text('Signing In...'),
                    ],
                  )
                : Text('Sign In'),
          ),
        ),
      ],
    );
  }
}
