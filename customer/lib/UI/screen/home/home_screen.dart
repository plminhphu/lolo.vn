import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:customer/UI/util/color.dart';
import 'package:customer/UI/util/size.dart';
import 'package:customer/UI/util/string.dart';
import 'package:customer/UI/util/icon.dart';
import 'package:customer/UI/widget/home/header_widget.dart';
import 'package:customer/UI/widget/home/main_widget.dart';


class HomeScreen extends StatelessWidget{
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(10.852321, 106.7583018);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: colorBackground,
      body: Stack(
        children: <Widget>[
          Container(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 18.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: HeaderWidget(),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: MainWidget(),
          ),
        ],
      )
    );
  }
}