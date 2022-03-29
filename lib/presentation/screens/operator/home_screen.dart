import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_frontend/constants/presentation_constants.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';
import 'package:sih_frontend/presentation/screens/operator/new_call_modal.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';

class OperatorHomePage extends StatefulWidget {
  final LatLng? originCoor;
  const OperatorHomePage({Key? key, this.originCoor}) : super(key: key);

  @override
  State<OperatorHomePage> createState() => _OperatorHomePageState();
}

class _OperatorHomePageState extends State<OperatorHomePage> {
  late bool _isAvailable;
  late Map returnData;
  late bool _notifyUser;

  @override
  void initState() {
    super.initState();
    _isAvailable = true;
    _notifyUser = false;
  }

  void changeAvailability(Map returnData) {
    if (returnData['call'] == 'accepted') {
      setState(() {
        _isAvailable = false;
        _notifyUser = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PillButton(
        width: 120,
        text: 'Logout',
        visible: true,
        onTap: () => context.router.popAndPush(const InitRoute()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Tap the below button to change availability',
            style: kHeadlineTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextButton(
            child: Text(
              'Available: ' + (_isAvailable == true ? 'YES' : 'NO'),
              style: kHeadlineTextStyle.copyWith(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor:
                  _isAvailable == true ? kEnabledColor : Colors.red[600],
            ),
            onPressed: () {
              setState(() {
                _isAvailable = !_isAvailable;
              });
              if (_isAvailable == true) {
                _triggerServiceCall();
              }
            },
          ),
          PillButton(
            text: 'Notify User',
            visible: _notifyUser,
            width: 150,
            onTap: () => {},
          ),
          PillButton(
            text: 'Enter OTP',
            visible: _notifyUser,
            width: 150,
            onTap: () => context.router
                .push(const VerifyAuthCodeRoute()), // Go to OTP Screen
          ),
        ],
      ),
    );
  }

  void _triggerServiceCall() {
    Future.delayed(const Duration(seconds: 5), () async {
      returnData = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return const NewCallModalPage();
        },
      );
      changeAvailability(returnData);
    });
  }
}
