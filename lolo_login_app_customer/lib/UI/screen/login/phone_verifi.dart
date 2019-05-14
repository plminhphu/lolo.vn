import 'package:flutter/material.dart';
import 'package:lolo_login_app_customer/UI/util/color.dart';
import 'package:lolo_login_app_customer/UI/util/size.dart';
import 'package:lolo_login_app_customer/UI/widget/phone_verifi/header_widget.dart';
import 'package:lolo_login_app_customer/UI/widget/phone_verifi/main_widget.dart';


class PhoneVerifiScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackgroundWhite,
      body: Container(
        child: Column(
          children: <Widget>[
            HeaderWidget(),
            MainWidget(),
          ],
        ),
      ),
    );
  }
}