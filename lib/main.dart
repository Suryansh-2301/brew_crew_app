import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:brew_crew_app/Screens/wrapper.dart';
import 'package:brew_crew_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Use>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper()),
    );
  }
}
