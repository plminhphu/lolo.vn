import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';
import 'package:customer/UI/util/string.dart';
import 'package:customer/UI/util/icon.dart';
import 'package:customer/UI/slide/slide_right_route.dart';
import 'package:customer/UI/screen/login/login_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:toast/toast.dart';

class HeaderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: sizeBoxLine,
          ),
          IconButton(
            tooltip: stringProfile,
            color: colorBackground,
            onPressed: (){
              _checkin(context);
            },
            iconSize: sizeButtonBig,
            icon: iconPerson,
          ),
          IconButton(
            tooltip: stringExit,
            color: colorBackground,
            onPressed: (){
              _Logout(context);
            },
            iconSize: sizeButtonBig,
            icon: iconExit,
          ),
        ],
      ),
    );
  }
  _checkin(context) {
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