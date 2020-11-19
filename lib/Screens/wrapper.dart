import 'package:flutter/material.dart';
import 'package:brew_crew_app/Screens/authenticate/authenticate.dart';
import 'package:brew_crew_app/Screens/home/home.dart';
import '../model/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Use>(context);
    print(user);

    //return either home or authenticate widget
    if(user == null)
      {
        return Authenticate();
      }
    else
      {
        return Home();
      }
  }
}
