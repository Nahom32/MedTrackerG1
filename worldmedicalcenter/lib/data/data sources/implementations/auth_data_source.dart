import 'package:dio/dio.dart';
import '../../../domain/models/auth.dart';
import '../../../domain/models/user.dart';
import '../interfaces/auth_data.dart';

// ignore: constant_identifier_names
const String API_BASE =
    "https://b138-2a0d-5600-42-3000-00-27e8.ngrok.io/swagger/index.html";

class AuthDataSource implements AuthData {
  @override
  Future<User> create(Auth auth) async {
    var response = await Dio().post('$API_BASE/user/login',
        data: {'emailAddress': auth.emailAddress, 'password': auth.password});
    User user = User(
        userName: response.data["userName"],
        emailAddress: response.data["emailAddress"],
        date: response.data['date'],
        allergies: response.data['allergies'],
        medicines: response.data['medicines'],
        diagnonses: response.data['diagnoses'],
        vaccines: response.data['vaccines'],
        profiles: response.data['profiles']);
    return user;
  }
}
