import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';
import 'package:customer/UI/util/string.dart';
import 'package:customer/UI/util/icon.dart';

class MainWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: sizeBoxLine,
          ),
          IconButton(
            tooltip: stringProfile,
            color: colorBackground,
            onPressed: (){
            },
            iconSize: sizeButtonBig,
            icon: iconFullScreen,
          ),
          IconButton(
            tooltip: stringProfile,
            color: colorBackground,
            onPressed: (){
            },
            iconSize: sizeButtonBig,
            icon: iconZoomIn,
          ),
          IconButton(
            tooltip: stringExit,
            color: colorBackground,
            onPressed: (){
            },
            iconSize: sizeButtonBig,
            icon: iconZoomOut,
          ),
        ],
      ),
    );
  }

}
