import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:sih_frontend/constants/presentation_constants.dart';
import 'package:sih_frontend/global.dart';
import 'package:sih_frontend/presentation/routes/app_routes.gr.dart';
import 'package:sih_frontend/presentation/shared_widgets/banner.dart';
import 'package:sih_frontend/presentation/shared_widgets/pill_button.dart';

class AuthCodePage extends StatelessWidget {
  final UserRole? loginAs;
  const AuthCodePage({Key? key, this.loginAs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomBanner(),
            LoginForm(loginAs: loginAs),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, this.loginAs}) : super(key: key);
  final UserRole? loginAs;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<FormState> _formKey;
  late GlobalKey<FormFieldState> _authFieldKey;
  String? _authCode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _authFieldKey = GlobalKey<FormFieldState>();
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
              key: _authFieldKey,
              onChanged: (value) => _authFieldKey.currentState!.validate(),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                hintText: 'OTP',
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
              validator: (value) => _validateOTP(value),
              onEditingComplete: () => _submitForm(),
            ),
            const SizedBox(height: 25.0),
            PillButton(
              text: 'Login',
              onTap: _submitForm,
            ),
          ],
        ),
      ),
    );
  }

  String? _validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the received OTP';
    }

    _authCode = value;

    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Global.initUser();
      Global.setCurrentUserRole = widget.loginAs!;
      context.router.push(const LocationRoute());
    }
  }
}
