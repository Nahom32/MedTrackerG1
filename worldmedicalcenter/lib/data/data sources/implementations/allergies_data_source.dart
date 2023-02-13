// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import '../interfaces/allergies_data.dart';

const String API_BASE =
    "https://b138-2a0d-5600-42-3000-00-27e8.ngrok.io/swagger/index.html";

class AllergiesDataSources implements AllergiesData {
  @override
  Future<Unit> create(Allergy data) async {
    await Dio().post("$API_BASE/user/allergies", data: {
      "id": data.id,
      "name": data.name,
      "code": data.code,
    });
    return unit;
  }

  @override
  Future<Allergy> find(
    String? name,
  ) async {
    var response = await Dio().get("$API_BASE/allergies/search/$name");
    Allergy allergy = Allergy(
        id: response.data['id'],
        name: response.data['name'],
        code: response.data['code']);
    return allergy;
  }

  @override
  Future<Unit> delete(String id) async {
    await Dio().delete("$API_BASE/user/allergies/$id");
    return unit;
  }
}
