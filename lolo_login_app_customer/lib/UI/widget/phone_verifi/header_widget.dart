import 'package:flutter/material.dart';
import 'package:lolo_login_app_customer/UI/util/color.dart';
import 'package:lolo_login_app_customer/UI/util/size.dart';
import 'package:lolo_login_app_customer/UI/util/string.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: colorBackground,
      padding: EdgeInsets.symmetric(
        horizontal: sizePaddingBoxHorizontal,
        vertical: sizePaddingBoxVertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackButton(color: colorButtonWhite),
          Text(
            stringTitlePhoneVerifi,
            style: TextStyle(
              fontSize: sizeFontSizeTitle,
              color: colorTextWhite,
            ),
          ),
          SizedBox(
            height: sizeBoxLine,
          ),
          Text(
            stringSpanOTPInput,
            style: TextStyle(
              color: colorButtonWhite,
              fontSize: sizeFontSizeSpan,
            ),
          ),
        ],
      ),
    );
  }
}