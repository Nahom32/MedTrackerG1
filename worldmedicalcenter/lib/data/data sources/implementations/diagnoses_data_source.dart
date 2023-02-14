// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/diagnoses.dart';
import '../interfaces/diagnoses_data.dart';

const String API_BASE =
    "https://b138-2a0d-5600-42-3000-00-27e8.ngrok.io/swagger/index.html";

class DignosesDataSources implements DiagnosesData {
  @override
  Future<Unit> create(Diagnoses data) async {
    await Dio().post("$API_BASE/user/diagnoses", data: {
      "id": data.id,
      "name": data.name,
      "code": data.code,
    });
    return unit;
  }

  @override
  Future<Diagnoses> find(String? name) async {
    var response = await Dio().get("$API_BASE/diagnoses/search/$name");
    Diagnoses diagnoses = Diagnoses(
        id: response.data['id'],
        name: response.data['name'],
        code: response.data['code']);
    return diagnoses;
  }

  @override
  Future<Unit> delete(String id) async {
    await Dio().delete("$API_BASE/user/diagnoses/$id");
    return unit;
  }
}
