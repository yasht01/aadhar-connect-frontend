import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';
import 'package:sih_frontend/presentation/screens/widgets/address_sheet.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  static const CameraPosition _kInitialPos = CameraPosition(
    target: LatLng(20.2958008485195, 85.74333664029837),
    zoom: 14.4746,
  );

  // static const CameraPosition _kLake = CameraPosition(
  //   bearing: 192.8334901395799,
  //   target: LatLng(37.43296265331129, -122.08832357078792),
  //   tilt: 59.440717697143555,
  //   zoom: 19.151926040649414,
  // );

  final location = Location();
  GoogleMapController? _controller;

  getLocation(LatLng dynamicPos) async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

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

    location.onLocationChanged.listen((locationData) {
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              dynamicPos.latitude,
              dynamicPos.longitude,
            ),
            zoom: 16.47,
          ),
        ),
      );
    });
  }

  LatLng dynamicPos = const LatLng(
    20.2958008485195,
    85.74333664029837,
  );

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final _locationData = await getUserLocation();
      dynamicPos = LatLng(_locationData.latitude!, _locationData.longitude!);

      setState(() {
        getLocation(dynamicPos);
      });
    });

    super.initState();
  }

  getUserLocation() async {
    final _locationData = await location.getLocation();
    return _locationData;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            constraints:
                BoxConstraints.tight(Size(screenSize.width, screenSize.height)),
            child: Stack(children: [
              Positioned(
                top: 25,
                left: 25,
                child: PillButton(
                  width: 150,
                  text: 'Confirm Location',
                  onTap: () => context.router.popAndPush(const InitRoute()),
                ),
              ),
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kInitialPos,
                zoomControlsEnabled: false,
                onCameraIdle: () {
                  setState(() {
                    getLocation(dynamicPos);
                  });
                },
                onCameraMove: (pos) {
                  dynamicPos = pos.target;

                  print(
                      'Dynamic position: ${dynamicPos.latitude}: ${dynamicPos.longitude}');
                },
                zoomGesturesEnabled: true,
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
              const Positioned(
                bottom: 0,
                child: AddressSheet(
                  address: 'Gothapatna, Malipada, Bhubaneswar, Odisha - 751003',
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   _controller!.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
