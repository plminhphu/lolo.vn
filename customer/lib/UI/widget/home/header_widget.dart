import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';
import 'package:customer/UI/util/string.dart';
import 'package:customer/UI/slide/slide_right_route.dart';
import 'package:customer/UI/screen/login/login_screen.dart';
import 'package:toast/toast.dart';

class HeaderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('546132145643253'),
    );
  }
  _checkin(context){
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.currentUser().then((user){
      if(user.uid != null){
        Toast.show(user.phoneNumber, context);
      }else{
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }
  _Logout(context) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signOut();
    Navigator.push(context, SliderRightRoute(page: LoginScreen()));
  }
}