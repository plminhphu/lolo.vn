import 'package:flutter/material.dart';
import 'package:lolo_login_app_customer/UI/util/color.dart';
import 'package:lolo_login_app_customer/UI/util/size.dart';
import 'package:lolo_login_app_customer/UI/widget/login/header_widget.dart';
import 'package:lolo_login_app_customer/UI/widget/login/main_widget.dart';
import 'package:lolo_login_app_customer/UI/widget/login/footer_widget.dart';


class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: colorBackground,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/image/background.png'),
            alignment: Alignment.topCenter,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                HeaderWidget(),
                MainWidget(),
                FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}