import 'package:auto_route/auto_route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
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
              launchURL(); // TODO: Make it dynamic
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

  launchURL() async {
    const url =
        'https://www.google.com/maps/dir/?api=1&origin=20.2864451,85.8332186&destination=20.2945161,85.7428483&travelmode=driving&dir_action=navigate';

    final String encodedURl = Uri.encodeFull(url);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      print('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }
}
