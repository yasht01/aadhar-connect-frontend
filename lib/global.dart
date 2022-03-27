import 'package:sih_frontend/models/user_model.dart';

enum User { operator, resident }

class Global {
  static UserModel? currentUser;

  static set setCurrentUserRole(User user) {
    currentUser!.isOperator = user;
  }
}
