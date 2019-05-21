import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';
import 'package:customer/UI/util/string.dart';
import 'package:customer/UI/util/icon.dart';
import 'package:customer/UI/widget/home/header_widget.dart';
import 'package:customer/UI/widget/home/main_widget.dart';


class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: colorBackground,
      body: Stack(
        children: <Widget>[
          MainWidget(),
          HeaderWidget(),
        ],
      )
    );
  }
}