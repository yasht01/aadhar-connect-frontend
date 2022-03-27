import 'package:auto_route/auto_route.dart';

import '../../presentation/screens/booked_screen.dart';
import '../../presentation/screens/confirm_location_screen.dart';
import '../../presentation/screens/form_screen.dart';
import '../../presentation/screens/history_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/onboarding_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnboardingPage, initial: true),
    AutoRoute(page: LocationPage),
    AutoRoute(page: ConfirmationPage), // booked_screen.dart
    AutoRoute(page: HistoryPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: FormPage),
  ],
)
// extend the generated private router
class $AppRouter {}
