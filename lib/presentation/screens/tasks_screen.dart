import 'dart:ui';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:sih_frontend/constants/presentation_constants.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';
import 'package:sih_frontend/presentation/screens/widgets/bottom_sheet_contents.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  bool biometricUpdate = false;
  bool biometricReg = false;
  bool demographicsUpdate = false;
  bool demographicsReg = false;
  bool other = false;

  onBiometricRegChanged(bool? val) {
    setState(() {
      biometricReg = val!;
      print('Biometric registration: $biometricReg');
    });
  }

  onBiometricUpdChanged(bool? val) {
    setState(() {
      biometricUpdate = val!;
      print('Biometric registration: $biometricUpdate');
    });
  }

  onDemographicsRegChanged(bool? val) {
    setState(() {
      demographicsReg = val!;
      print('Biometric registration: $demographicsReg');
    });
  }

  onDemographicUpdChanged(bool? val) {
    setState(() {
      demographicsUpdate = val!;
      print('Biometric registration: $demographicsUpdate');
    });
  }

  onOthersSelected(bool? val) {
    setState(() {
      other = val!;
    });
  }

  Future<bool> confirmationBottomSheet() async {
    bool x = false;
    x = await showModalBottomSheet(
      context: context,
      builder: (ctx) => BottomSheetContent(
        biometricReg: biometricReg,
        biometricUpdate: biometricUpdate,
        demographicsReg: demographicsReg,
        demographicsUpdate: demographicsUpdate,
        other: other,
      ),
    );
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                'Select Services :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 50),
            CheckBoxWidget(
              onChangedFunction: onBiometricRegChanged,
              task: 'Biometric Registration',
              taskVal: biometricReg,
            ),
            CheckBoxWidget(
              onChangedFunction: onDemographicsRegChanged,
              task: 'Demographics Registration',
              taskVal: demographicsReg,
            ),
            CheckBoxWidget(
              onChangedFunction: onBiometricUpdChanged,
              task: 'Biometric Updation',
              taskVal: biometricUpdate,
            ),
            CheckBoxWidget(
              onChangedFunction: onDemographicUpdChanged,
              task: 'Demographics Updation',
              taskVal: demographicsUpdate,
            ),
            CheckBoxWidget(
              task: 'Other',
              onChangedFunction: onOthersSelected,
              taskVal: other,
            )
          ],
        ),
      ),
      floatingActionButton: PillButton(
        text: 'Confirm Request',
        onTap: () async {
          final x = await confirmationBottomSheet();
          if (x) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 5),
                content: Text(
                    'Request sent successfully. Please check your inbox for OTP'),
              ),
            );

            Future.delayed(const Duration(seconds: 2))
                .then((value) => context.router.push(const HomeRoute()));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  final String? task;
  final Function(bool?)? onChangedFunction;
  final bool? taskVal;
  const CheckBoxWidget(
      {Key? key, this.taskVal, this.task, this.onChangedFunction})
      : super(key: key);

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: widget.taskVal,
        onChanged: widget.onChangedFunction!,
        title: Text(
          widget.task!,
          style: const TextStyle(color: Colors.black),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        selected: widget.taskVal!,
        checkColor: Colors.white,
        activeColor: kEnabledColor,
        selectedTileColor: Colors.green[50],
      ),
    );
  }
}
