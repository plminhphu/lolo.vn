import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';
import 'package:customer/UI/util/string.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: colorBackground,
      margin: EdgeInsets.all(sizeMarginBox),
      padding: EdgeInsets.all(sizePaddingBox),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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