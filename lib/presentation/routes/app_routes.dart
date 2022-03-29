import 'package:auto_route/auto_route.dart';
import 'package:sih_frontend/presentation/screens/auth_code_screen.dart';
import 'package:sih_frontend/presentation/screens/operator/home_screen.dart';
import 'package:sih_frontend/presentation/screens/operator/new_call_modal.dart';
import 'package:sih_frontend/presentation/screens/operator/verify_auth_code_screen.dart';
import 'package:sih_frontend/presentation/screens/tasks_screen.dart';

import '../../presentation/screens/booked_screen.dart';
import '../../presentation/screens/confirm_location_screen.dart';
import '../../presentation/screens/form_screen.dart';
import '../../presentation/screens/history_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/onboarding_screen.dart';
import '../../presentation/screens/init_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnboardingPage),
    AutoRoute(page: LocationPage),
    AutoRoute(page: ConfirmationPage), // booked_screen.dart
    AutoRoute(page: HistoryPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: FormPage),
    AutoRoute(page: InitPage, initial: true),
    AutoRoute(page: AuthCodePage),
    AutoRoute(page: OperatorHomePage),
    AutoRoute(page: NewCallModalPage),
    AutoRoute(page: VerifyAuthCodePage),
    AutoRoute(page: TasksPage),
  ],
)
// extend the generated private router
class $AppRouter {}
