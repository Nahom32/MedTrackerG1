import 'package:dio/dio.dart';
import 'package:worldmedicalcenter/domain/models/PersonalInfo.dart';
import '../../../domain/models/auth.dart';
import '../interfaces/auth_data.dart';

// ignore: constant_identifier_names
const String API_BASE =
    "http://localhost:5260";

class AuthDataSource implements AuthData {
  @override
  Future<PersonalInfo> create(Auth auth) async {
    var response = await Dio().post('$API_BASE/api/auth/login',
        data: {'emailAddress': auth.emailAddress, 'password': auth.password},options: Options(headers: {"" : ""}));
     PersonalInfo user = PersonalInfo(id: response.data['id']);
    return user;
  }
}
