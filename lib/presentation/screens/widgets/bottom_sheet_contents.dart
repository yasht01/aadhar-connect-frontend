import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';

class BottomSheetContent extends StatefulWidget {
  bool? biometricUpdate = false;
  bool? biometricReg = false;
  bool? demographicsUpdate = false;
  bool? demographicsReg = false;
  bool? other = false;
  BottomSheetContent(
      {Key? key,
      this.biometricReg,
      this.biometricUpdate,
      this.demographicsReg,
      this.demographicsUpdate,
      this.other})
      : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      constraints: BoxConstraints(
        minHeight: 200,
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 300,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8, bottom: 4),
            child: Text(
              'Confirm your request(s) : ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (widget.biometricUpdate!)
            const Text(
              '- Biometric Update',
              style: TextStyle(fontSize: 16),
            ),
          if (widget.biometricReg!)
            const Text(
              '- Biometric Registration',
              style: TextStyle(fontSize: 16),
            ),
          if (widget.demographicsUpdate!)
            const Text(
              '- Demographics Update',
              style: TextStyle(fontSize: 16),
            ),
          if (widget.demographicsReg!)
            const Text(
              '- Demographics Registration',
              style: TextStyle(fontSize: 16),
            ),
          if (widget.other!)
            const Text(
              '- Others',
              style: TextStyle(fontSize: 16),
            ),
          const SizedBox(height: 10),
          PillButton(
            text: 'Send Request',
            onTap: () {
              Navigator.pop(context, true);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(
                      'Request sent successfully. Please check your inbox for OTP'),
                ),
              );

              Future.delayed(const Duration(seconds: 2))
                  .then((value) => context.router.push(const HomeRoute()));
            },
          ),
        ],
      ),
    );
  }
}
