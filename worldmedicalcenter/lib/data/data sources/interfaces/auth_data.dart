import 'package:worldmedicalcenter/data/entities/auth_entity.dart';
import 'package:worldmedicalcenter/data/entities/user_entity.dart';

abstract class AuthData {
  Future<UserEntity> create(AuthEntity authEntity);
}
