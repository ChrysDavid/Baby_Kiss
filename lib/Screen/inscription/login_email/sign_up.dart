import 'package:babikiss/Screen/inscription/login_number.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@gmail\.com$");
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Perform sign up with _email and _password
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginNumberPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!emailValidatorRegExp.hasMatch(value)) {
                      return 'Email must end with @gmail.com';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPassword = value ?? '';
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Already have an account? Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
