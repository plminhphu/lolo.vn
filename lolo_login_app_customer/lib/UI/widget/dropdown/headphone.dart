import 'package:flutter/material.dart';
import 'package:lolo_login_app_customer/UI/util/color.dart';
import 'package:lolo_login_app_customer/UI/util/size.dart';

String dropdownHeadPhoneValue = 'Viet Nam';

class HeadPhone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.only(left: sizePaddingInput),
        child: DropdownButton<String>(
          value: dropdownHeadPhoneValue,
          onChanged: (String newValue) {

          },
          style: TextStyle(
            color: colorText,
            fontSize: sizeFontSizeHeadPhone,
          ),
          items: <String>['Viet Nam', 'Hoa Ky', 'Anh', 'Phap']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Image.asset(
                        'assets/image/country/vn.png',
                        width: 35,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
  }
}
