import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer/UI/screen/home/home_screen.dart';
import 'package:customer/UI/screen/login/login_screen.dart';
import 'package:customer/UI/screen/login/phone_verifi.dart';
import 'package:customer/UI/screen/map.dart';

void main() => runApp(new LoLoApp());
const keyGoogleApiKey = "AIzaSyCN1__fN5bB2b65CGJ8TzFX1lUKqGURWRA";

class LoLoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: _handleCurrentScreen(),
        routes: <String, WidgetBuilder> {
          '/home': (BuildContext context) => HomeScreen(),
          '/login': (BuildContext context) => LoginScreen(),
          '/phoneveri': (BuildContext context) => PhoneVerifiScreen(),
        }
    );
  }
}

Widget _handleCurrentScreen() {
  return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeScreen();
        } else {
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return LoginScreen();
        }
      }
  );
}