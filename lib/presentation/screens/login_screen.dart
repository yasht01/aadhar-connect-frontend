import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sih_frontend/constants/presentation_constants.dart';
import 'package:sih_frontend/global.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';
import 'package:sih_frontend/presentation/shared_widgets/banner.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';

class LoginPage extends StatelessWidget {
  final UserRole loginAs;
  const LoginPage({Key? key, required this.loginAs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomBanner(),
            LoginForm(
              loginAs: loginAs,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final UserRole loginAs;
  const LoginForm({Key? key, required this.loginAs}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<FormState> _formKey;
  late GlobalKey<FormFieldState> _aadhaarKey;
  Map<String, String?> _loginDetails = {
    'aadhaar': null,
  };

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _aadhaarKey = GlobalKey<FormFieldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Sign In to continue",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32.0,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35.0),
            TextFormField(
              key: _aadhaarKey,
              onChanged: (value) => _aadhaarKey.currentState!.validate(),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                hintText: 'Aadhaar Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: kEnabledColor,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              validator: (value) => _validateAadhaar(value),
            ),
            const SizedBox(height: 25.0),
            PillButton(
              text: 'Send OTP',
              onTap: _submitForm,
            ),
          ],
        ),
      ),
    );
  }

  String? _validateAadhaar(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Aadhaar Number';
    }
    if (value.length != 12) {
      return 'Please enter a valid Aadhaar Number';
    }

    _loginDetails = {
      'aadhaar': value,
    };

    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Submit data to LoginBloc
      print(_loginDetails);
      context.router.popAndPush(AuthCodeRoute(loginAs: widget.loginAs));
    }
  }
}
