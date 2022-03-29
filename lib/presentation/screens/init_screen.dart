import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:sih_frontend/presentation/shared_widgets/banner.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';
import '../routes/app_routes.gr.dart';
import '../../global.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomBanner(),
              const SizedBox(height: 40),
              PillButton(
                text: 'Login as Resident',
                visible: true,
                onTap: () {
                  context.router.push(
                    LoginRoute(
                      loginAs: UserRole.resident,
                    ),
                  );
                },
              ),
              PillButton(
                visible: true,
                onTap: () {
                  context.router.push(
                    LoginRoute(
                      loginAs: UserRole.operator,
                    ),
                  );
                },
                text: 'Login as Operator',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
