import 'package:flutter/material.dart';
import 'package:sih_frontend/global.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';

class LoginPage extends StatelessWidget {
  final User? loginAs;
  const LoginPage({Key? key, this.loginAs});

  @override
  Widget build(BuildContext context) {
    User? currentUserRole = loginAs;

    return Scaffold(
      body: Center(
        child: Text(
            'You\'re logging in as ${currentUserRole == User.operator ? 'Operator' : 'Resident'}'),
      ),
    );
  }
}
