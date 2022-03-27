import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:sih_frontend/global.dart';

import '../routes/app_routes.gr.dart';

import '../../constants/presentation_constants.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF272640),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: screenSize.height * 0.2),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kAccentColor,
              ),
              margin: const EdgeInsets.only(left: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                'Welcome Back',
                style: kHeadlineTextStyle.copyWith(color: Colors.white),
              ),
            ),
            TextButton(
                onPressed: () {
                  context.router.push(LoginRoute(
                    loginAs: User.resident,
                  ));
                },
                child: const Text('Login as Resident')),
            TextButton(
              onPressed: () {
                context.router.push(
                  LoginRoute(
                    loginAs: User.operator,
                  ),
                );
              },
              child: const Text('Login as Operator'),
            ),
          ],
        ),
      ),
    );
  }
}
