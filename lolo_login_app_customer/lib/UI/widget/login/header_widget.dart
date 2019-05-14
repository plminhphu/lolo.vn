import 'package:flutter/material.dart';
import 'package:lolo_login_app_customer/UI/util/color.dart';
import 'package:lolo_login_app_customer/UI/util/size.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
          height: sizeLoginPaddingTop,
        ),
    );
  }
}