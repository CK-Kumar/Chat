import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);
  final void Function(
      String email, String userName, String password, bool isLogin) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  var _login = true;
  String _userName = '';
  String _password = '';
  String _emailId = '';
  void _trySubmit() {
    FocusScope.of(context).unfocus();
    final allValid = _formKey.currentState!.validate();
    if (allValid) {
      _formKey.currentState!.save();
      widget.submitFn(_emailId, _userName, _password, _login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Enter a valid email id';
                    } else
                      return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) {
                    _emailId = value!;
                  },
                ),
                if (!_login)
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'User id is too short';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(labelText: 'Username'),
                    onSaved: (value) {
                      _userName = value!;
                    },
                  ),
                TextFormField(
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Password is too short';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(height: 12),
                RaisedButton(
                    child: Text(_login ? 'Log in' : 'Sign up'),
                    onPressed: _trySubmit),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      _login = !_login;
                    });
                  },
                  child: Text(
                      _login ? 'Create an Account' : 'Already have an account'),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
