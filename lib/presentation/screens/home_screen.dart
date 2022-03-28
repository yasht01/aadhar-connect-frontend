import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sih_frontend/constants/presentation_constants.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PillButton(
              text: 'Book Now',
              onTap: () => context.router.push(const TasksRoute()),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              visible: true,
            ),
            PillButton(
              text: 'Book Later',
              onTap: () => context.router.push(const TasksRoute()),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              visible: true,
            ),
          ],
        ),
      ),
      floatingActionButton: TextButton(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide()),
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {
          context.router.push(const HistoryRoute());
        },

        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all(kEnabledColor),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Text(
            'Previous Requests',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
