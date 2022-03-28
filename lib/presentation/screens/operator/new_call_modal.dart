import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sih_frontend/constants/presentation_constants.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';

class NewCallModalPage extends StatelessWidget {
  const NewCallModalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 250),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.check_circle, size: 20),
          const SizedBox(height: 20),
          Text(
            'New Service Call',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: kPrimaryColor400,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          PillButton(
            text: 'Accept',
            visible: true,
            onTap: () {
              context.router.pop({
                'call': 'accepted',
              });
              MapsLauncher.launchQuery(
                  '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA');
            },
          ), // To Google Maps app
          PillButton(
            text: 'Deny',
            visible: true,
            onTap: () => context.router.pop({
              'call': 'denied',
            }),
          ), // Dismiss modal
        ],
      ),
    );
  }
}
