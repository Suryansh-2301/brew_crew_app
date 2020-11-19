import 'package:flutter/material.dart';
import 'package:brew_crew_app/Screens/authenticate/register.dart';
import 'package:brew_crew_app/Screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  //toggle function
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn)
      return SignIn(toggleView: toggleView);
    else
      return Register(toggleView: toggleView);
  }
}
