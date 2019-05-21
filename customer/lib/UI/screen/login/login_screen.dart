import 'package:flutter/material.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/widget/login/header_widget.dart';
import 'package:customer/UI/widget/login/main_widget.dart';
import 'package:customer/UI/widget/login/footer_widget.dart';


class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: colorBackground,
      body: Container(
        child: Column(
          children: <Widget>[
            HeaderWidget(),
            Align(
              child: MainWidget(),
            ),
            FooterWidget(),
          ],
        ),
      ),
    );
  }

}