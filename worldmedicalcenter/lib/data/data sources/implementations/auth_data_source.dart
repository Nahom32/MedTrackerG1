import 'package:dio/dio.dart';
import 'package:worldmedicalcenter/domain/models/PersonalInfo.dart';
import '../../../domain/models/auth.dart';
import '../interfaces/auth_data.dart';

// ignore: constant_identifier_names
const String API_BASE =
    "https://b6f8-197-156-107-249.eu.ngrok.io";

class AuthDataSource implements AuthData {
  @override
  Future<String> create(String email, String password) async {
    var response = await Dio().post('https://b6f8-197-156-107-249.eu.ngrok.io/api/auth/login',
        data: {'email': email, 'password': password},options: Options(headers: {"Content-Type" : "application/json"}));
     String userToken = response.data['token'];
    return userToken;
  }
}
