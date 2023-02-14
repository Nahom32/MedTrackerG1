import 'package:dio/dio.dart';
import 'package:worldmedicalcenter/domain/models/PersonalInfo.dart';

import '../interfaces/personalInfo_data.dart';

const String API_BASE ="http://localhost:5260";

class PersonalInfoDataSources implements PersonalInfoData {

   @override
  Future<PersonalInfo> find(
  ) async {
    var response = await Dio().get("$API_BASE/api/user");
     PersonalInfo user = PersonalInfo();
     // something left
    return user;
  }

  @override 
  Future<PersonalInfo> edit(PersonalInfo user) async {
    var response = await Dio().patch("$API_BASE/api/user", data: { });

     PersonalInfo user = PersonalInfo();
     // something left
    return user;
  }


 
}