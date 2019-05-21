import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer/UI/screen/home/home_screen.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';
import 'package:customer/UI/util/string.dart';

class MainWidget extends StatelessWidget {
  TextEditingController _txtCodeOTP = TextEditingController();
  String verificationId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(sizeMarginBox),
      padding: EdgeInsets.all(sizePaddingBox),
      decoration: BoxDecoration(
        color: colorBackgroundWhite,
        borderRadius: BorderRadius.circular(sizeBorderRadius),
        boxShadow: [
          BoxShadow(
            blurRadius: sizeBlurRadius,
            color: colorBoxShadow,
            spreadRadius: sizeSpreadRadius,
          )
        ],
      ),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _txtCodeOTP,
                autofocus: true,
                textAlign: TextAlign.center,
                maxLines: 1,
                maxLength: 6,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: sizeFontSizeIputCodeOTP,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
            ),
            SizedBox(
              height: sizeBoxLine,
            ),
            RaisedButton(
              onPressed: (){
                getSharedPreferences('verificationIdLogin').then((value){
                  _verifiPhone(value, context);
                });
              },
              textColor: colorBackgroundWhite,
              color: colorBackground,
              padding: EdgeInsets.all(sizePaddingInput),
              child: Text(
                stringVeri,
                style: TextStyle(fontSize: sizeFontSizeButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _verifiPhone(String id, context){
    verificationId = id;
    FirebaseAuth.instance.currentUser().then((user) {
      if (user != null) {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
//        Toast.show(_txtCodeOTP.text, context);
//        Navigator.of(context).pop();
        signIn(context);
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }
//  Future<bool> smsCodeDialog(BuildContext context) {
//    return showDialog(
//        context: context,
//        barrierDismissible: false,
//        builder: (BuildContext context) {
//          return new AlertDialog(
//            title: Text('Enter sms Code'),
//            content: TextField(
//              onChanged: (value) {
//                this.smsCode = value;
//              },
//            ),
//            contentPadding: EdgeInsets.all(10.0),
//            actions: <Widget>[
//              new FlatButton(
//                child: Text('Xác nhận'),
//                onPressed: () {
//
//                },
//              )
//            ],
//          );
//        });
//  }

  signIn(context) {
    FirebaseAuth.instance.signInWithPhoneNumber(verificationId: verificationId, smsCode: _txtCodeOTP.text).then((user) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/home');
    }).catchError((e) {
      Toast.show(e, context);
    });
  }

  static Future<String> getSharedPreferences(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

}
