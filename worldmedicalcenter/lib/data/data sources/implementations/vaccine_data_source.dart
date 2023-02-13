// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/models/vaccine.dart';
import '../interfaces/vaccine_data.dart';

const String API_BASE =
    "https://b138-2a0d-5600-42-3000-00-27e8.ngrok.io/swagger/index.html";

class VaccineDataSources implements VaccineData {
  @override
  Future<Unit> create(Vaccine data) async {
    await Dio().post("$API_BASE/user/allergies", data: {
      "id": data.id,
      "name": data.name,
      "code": data.code,
    });
    return unit;
  }

  @override
  Future<Vaccine> find(
    String? name,
  ) async {
    var response = await Dio().get("$API_BASE/vaccines/search/$name");
    Vaccine vaccine = Vaccine(
        id: response.data['id'],
        name: response.data['name'],
        code: response.data['code']);
    return vaccine;
  }

  @override
  Future<Unit> delete(String id) async {
    await Dio().delete("$API_BASE/user/vaccines/$id");
    return unit;
  }
}
