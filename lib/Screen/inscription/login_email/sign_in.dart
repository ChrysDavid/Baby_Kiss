import 'package:babikiss/Screen/inscription/login_email/sign_up.dart';
import 'package:babikiss/Screen/inscription/login_number.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@gmail\.com$");

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
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
        title: Text('Sign In'),
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
                      return 'Email must be a valid @gmail.com address';
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text('Sign In'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
