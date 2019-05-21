import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lolo_login_app_customer/UI/screen/login/login_screen.dart';


void main(){
  SystemChrome.setEnabledSystemUIOverlays ([]);
  runApp(
    MaterialApp(
      home: LoginScreen(),
    ),
  );
}
