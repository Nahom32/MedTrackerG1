

import 'package:worldmedicalcenter/domain/models/PersonalInfo.dart';

import '../../../domain/models/auth.dart';

abstract class AuthData {
  Future<PersonalInfo> create(Auth auth);
}
