import 'package:flutter/material.dart';

import '../../constants/presentation_constants.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/aadhar_logo.png'),
        const SizedBox(width: 20),
        const Text(
          'Aadhaar Connect',
          style: kHeadlineTextStyle,
        ),
      ],
    );
  }
}