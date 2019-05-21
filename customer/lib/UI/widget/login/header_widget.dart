import 'package:flutter/material.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/image/background.png'),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitHeight,
          )
      ),
    );
  }
}