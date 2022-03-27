import 'package:flutter/material.dart';

import 'widgets/carousel.dart';
import '../../constants/presentation.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text(
                'Aadhaar Connect',
                style: kHeadlineTextStyle,
              ),
              Image.asset('assets/images/aadhar_logo.png'),
            ],
          ),
          const CarouselWithIndicator(),
        ],
      ),
    );
  }
}
