import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';
import 'package:customer/UI/util/string.dart';
import 'package:customer/UI/util/icon.dart';
import 'package:customer/UI/slide/slide_right_route.dart';
import 'package:customer/UI/screen/login/phone_verifi.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MainWidget extends StatelessWidget {
  TextEditingController _textfieldPhoneNumber = TextEditingController();
  TextEditingController _textfieldCodeCountry = TextEditingController();
  List<String> dataCountry = <String>['assets/image/country/vn.png', 'assets/image/country/sing.png', 'assets/image/country/thai.png'];
  List<String> dataCodePhone = <String>['+84', '+65', '+66'];
  String phoneNo;
  String smsCode;
  String verificationId;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(sizeMarginBox),
      padding: EdgeInsets.all(sizePaddingBox),
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
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: colorBorder),
              borderRadius: BorderRadius.circular(sizeBorderRadius),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.only(left: sizePaddingInput),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        style: TextStyle(
                            textBaseline: TextBaseline.ideographic
                        ),
                        value: dataCountry.first,
                        onChanged: (String newValue) {
                          _onChangeCodePhone(newValue);
                        },
                        items: dataCountry.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Image.asset(value, width: sizeWidthCountry),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _textfieldCodeCountry,
                    autofocus: false,
                    maxLines: 1,
                    maxLength: 3,
                    style: TextStyle(
                      fontSize: sizeFontSizeIputNumberPhone,
                    ),
                    onTap: _onTapCodePhone(),
                    decoration: InputDecoration(
                      enabled: false,
                      border: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: _textfieldPhoneNumber,
                    autofocus: true,
                    maxLines: 1,
                    maxLength: 12,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      fontSize: sizeFontSizeIputNumberPhone,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                ),
                IconButton(
                  tooltip: stringClear,
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

  _onTapCodePhone(){
    _textfieldCodeCountry.text = dataCodePhone[0].toString();
  }

  _onChangeCodePhone(String value){
    for(var i = 0; i < dataCountry.length; i++){
      if(dataCountry[i].toString() == value){
        _textfieldCodeCountry.text = dataCodePhone[i].toString();
      }
    }
  }

  _onClearPhoneNumber() {
    _textfieldPhoneNumber.text = "";
  }


  void _onCheckPhoneNumber(context) async{
    verifyPhone(context);

//    Navigator.of(context).pop();
//    Navigator.of(context).pushReplacementNamed('/phoneveri');
  }

  Future<void> verifyPhone(context) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;
      setSharedPreferences('verificationIdLogin', verificationId);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/phoneveri');
    };
    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
      Toast.show('Welcome ' + user.phoneNumber, context);
    };
    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      Toast.show('${exception.message}', context);
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _textfieldCodeCountry.text + _textfieldPhoneNumber.text,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  static Future<bool> setSharedPreferences(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }
}

