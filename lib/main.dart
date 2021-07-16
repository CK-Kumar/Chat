// @dart=2.9
import 'package:chatapp/screen/auth_screen.dart';
import 'package:chatapp/screen/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ck Chat',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.purple,
          backgroundColor: Colors.pink,
          accentColorBrightness: Brightness.dark,
          buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.pink,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
      home: AuthScreen(),
    );
  }
}
