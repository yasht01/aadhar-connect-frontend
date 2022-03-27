import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';

import 'widgets/transparent_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TransparentButton(
            icon: Icons.east,
            size: 40,
            callback: () => context.router.push(const LocationRoute()),
          ),
      ),
    );
  }
}