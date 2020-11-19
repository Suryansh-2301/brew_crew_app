import 'package:flutter/material.dart';
import 'package:brew_crew_app/services/auth.dart';
import 'package:brew_crew_app/shared/constants.dart';
import 'package:brew_crew_app/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //global key of type formstate it keeps track of state of our form
  final _formKey = GlobalKey<FormState>();

  //state for loading widget
  bool loading = false;

  //text field state
  String email = ' ';
  String password = ' ';
  String error = ' ';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign Up'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'Enter a Email'),
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'Enter a password'),
                validator: (val) => val.length < 6
                    ? 'Password should be at least 6 characters'
                    : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.deepOrangeAccent,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = 'Please supply a valid email or password';
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
