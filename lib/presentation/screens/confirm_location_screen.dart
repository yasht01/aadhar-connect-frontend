import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_frontend/presentation/screens/widgets/address_sheet.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  final location = Location();
  GoogleMapController? _controller;

  getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData = LocationData.fromMap(
      {
        'latitude': 37.43296265331129,
        'longitude': -122.08832357078792,
      },
    );

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    location.onLocationChanged.listen((locationData) {
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              _locationData.latitude!,
              _locationData.longitude!,
            ),
            zoom: 16,
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    setState(() {
      getLocation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    LatLng? dynamicPos;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            constraints:
                BoxConstraints.tight(Size(screenSize.width, screenSize.height)),
            child: Stack(children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                zoomControlsEnabled: false,
                onCameraIdle: () {},
                onCameraMove: (pos) {
                  dynamicPos = pos.target;
                  print(
                      'Dynamic position: ${dynamicPos!.latitude}: ${dynamicPos!.longitude}');
                },
                markers: {
                  const Marker(
                    markerId: MarkerId("center-current-location"),
                    draggable: false,
                  ),
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
              ),
              Positioned(
                child: Image.asset(
                  'assets/images/pin_location.png',
                  alignment: Alignment.center,
                  // color: Colors.red,
                  height: 25,
                  width: 25,
                ),
                left: screenSize.width / 2,
                top: screenSize.height / 2,
              ),
              Positioned(
                bottom: 0,
                child: AddressSheet(
                  address: 'Gothapatna, Malipada, Bhubaneswar, Odisha - 751003',
                ),
              ),
              
            ]),
          ),

          // AddressSheet(
          //   address: 'This is an address',
          // ),
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
