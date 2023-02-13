

import '../../../domain/models/auth.dart';
import '../../../domain/models/user.dart';

abstract class AuthData {
  Future<User> create(Auth auth);
}
