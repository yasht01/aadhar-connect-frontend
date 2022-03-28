import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sih_frontend/constants/presentation_constants.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';

class VerifyAuthCodePage extends StatelessWidget {
  const VerifyAuthCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RoundedWithCustomCursor(),
    );
  }
}

class RoundedWithCustomCursor extends StatefulWidget {
  const RoundedWithCustomCursor({Key? key}) : super(key: key);

  @override
  _RoundedWithCustomCursorState createState() =>
      _RoundedWithCustomCursorState();
}

class _RoundedWithCustomCursorState extends State<RoundedWithCustomCursor> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = kEnabledColor;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 100),
        const Text(
          'Enter OTP',
          style: kHeadlineTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Pinput(
          controller: pinController,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          length: 6,
          validator: (value) {
            if (value == '123456') {
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                    const SnackBar(
                      content: Text('Service Completed'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: kEnabledColor,
                    ),
                  )
                  .closed
                  .then(
                    (value) => context.router.popAndPush(
                      const OperatorHomeRoute(),
                    ),
                  );
              return null;
            } else {
              return 'Invalid OTP';
            }
            ;
          },
          onClipboardFound: (value) {
            debugPrint('onClipboardFound: $value');
            pinController.setText(value);
          },
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onCompleted: debugPrint,
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 9),
                width: 22,
                height: 1,
                color: focusedBorderColor,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: fillColor,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "One Time Password(OTP) is sent to the resident's mobile device",
          style: kHeadlineTextStyle.copyWith(
            color: kPrimaryColor200,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
