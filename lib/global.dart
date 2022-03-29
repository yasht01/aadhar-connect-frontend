import 'package:sih_frontend/models/user_model.dart';

enum UserRole { operator, resident }
enum BiometricServices {
  enrolment,
  update,
}

enum Demographics {
  enrolment,
  update,
}

class Global {
  static UserModel? currentUser;
  static initUser() {
    currentUser ??= UserModel();
  }

  static set setCurrentUserRole(UserRole user) {
    currentUser!.userRole = user;
  }
}
