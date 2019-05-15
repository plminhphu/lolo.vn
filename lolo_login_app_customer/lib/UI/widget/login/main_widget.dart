import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lolo_login_app_customer/UI/slide/slide_right_route.dart';
import 'package:lolo_login_app_customer/UI/screen/login/phone_verifi.dart';
import 'package:lolo_login_app_customer/UI/util/color.dart';
import 'package:lolo_login_app_customer/UI/util/size.dart';
import 'package:lolo_login_app_customer/UI/util/string.dart';
import 'package:lolo_login_app_customer/UI/util/icon.dart';
import 'package:lolo_login_app_customer/UI/widget/dropdown/headphone.dart';

class MainWidget extends StatelessWidget {

  TextEditingController _textfieldPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: sizeMarginBoxHorizontal,
        vertical: sizeMarginBoxVertical,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: sizePaddingBoxHorizontal,
        vertical: sizePaddingBoxVertical,
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            stringTitleSignIn,
            style: TextStyle(
              fontSize: sizeFontSizeTitle,
              color: colorText,
            ),
          ),
          SizedBox(
            height: sizeBoxLine,
          ),
          Text(
            stringInputPhone,
            style: TextStyle(
              color: colorText,
              fontSize: sizeFontSizeSpan,
            ),
          ),
          SizedBox(
            height: sizeBoxLine,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: colorBorder),
              borderRadius: BorderRadius.circular(sizeBorderRadius),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  child: HeadPhone(),
                ),
                Expanded(
                  child: TextField(
                    controller: _textfieldPhoneNumber,
                    autofocus: true,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      fontSize: sizeFontSizeIputNumberPhone,
                    ),
                    onChanged: (text){
                      _onCheckChangePhoneNumber(text);
                    },
                  ),
                ),
                IconButton(
                  onPressed: (){
                    _onClearPhoneNumber();
                  },
                  icon: iconClear,
                ),
              ],
            ),
          ),
          SizedBox(
            height: sizeBoxLine,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: (){
                _onCheckPhoneNumber(context);
              },
              textColor: colorBackgroundWhite,
              color: colorBackground,
              padding: EdgeInsets.all(sizePaddingInput),
              child: Text(
                stringNext,
                style: TextStyle(fontSize: sizeFontSizeButton),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onClearPhoneNumber() {
    _textfieldPhoneNumber.text = "";
  }
  _onCheckChangePhoneNumber(text){
    int phone = int.tryParse(text.toString());
    if(phone < 0 || phone > 999999999 || phone == null){
      _textfieldPhoneNumber.text = "";
    }
  }
  _onCheckPhoneNumber(context){
    int phone = int.tryParse(_textfieldPhoneNumber.text.toString());
    if(phone > 100000000 && phone < 999999999){

      Navigator.push(
          context,
          SliderRightRoute(page: PhoneVerifiScreen())
      );
    }
  }
}

