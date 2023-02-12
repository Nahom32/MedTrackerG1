import 'package:dio/dio.dart';
import 'package:worldmedicalcenter/data/entities/auth_entity.dart';
import 'package:worldmedicalcenter/data/entities/user_entity.dart';

import '../interfaces/auth_data.dart';

const String API_BASE = "http";

class AuthDataSource implements AuthData {
  @override
  Future<UserEntity> create(AuthEntity authEntity) async {
    var response = await Dio().post('$API_BASE/login', data: {
      'emailAddress': authEntity.emailAddress,
      'password': authEntity.password
    });
    UserEntity user = UserEntity(
        userName: response.data["userName"],
        emailAddress: response.data["emailAddress"],
        date: response.data['date']);
    return user;
  }
}
