import 'package:flutter/material.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_frontend/global.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';

class AddressSheet extends StatefulWidget {
  final String? address;
  final LatLng? latLng;
  const AddressSheet({Key? key, this.address, this.latLng}) : super(key: key);

  @override
  _AddressSheetState createState() => _AddressSheetState();
}

class _AddressSheetState extends State<AddressSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      constraints: BoxConstraints(
        maxHeight: 200,
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: 100,
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: TextFormField(
            scrollPadding:
                EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 2),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                gapPadding: 5,
              ),
            ),
            initialValue: widget.address,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        PillButton(
          text: 'Submit',
          onTap: () => Global.currentUser!.userRole == UserRole.operator
              ? context.router
                  .push(OperatorHomeRoute(originCoor: widget.latLng))
              : context.router.push(const HomeRoute()),
          width: 250,
          // style: TextStyle(color: Colors.white),
        ),
      ]),
    );
  }
}
