import 'package:flutter/material.dart';
import '../routes/app_routes.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Aadhar Connect',
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
