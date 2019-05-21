import 'package:flutter/material.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';
import 'package:customer/UI/widget/phone_verifi/header_widget.dart';
import 'package:customer/UI/widget/phone_verifi/main_widget.dart';


class PhoneVerifiScreen extends StatelessWidget{
  String phone;
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
          ],
        ),
      ),
    );
  }
}