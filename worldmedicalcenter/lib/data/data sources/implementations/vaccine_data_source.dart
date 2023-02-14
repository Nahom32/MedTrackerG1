// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/models/vaccine.dart';
import '../interfaces/vaccine_data.dart';

const String API_BASE =
    "https://b138-2a0d-5600-42-3000-00-27e8.ngrok.io/swagger/index.html";

class VaccineDataSources implements VaccineData {
  @override
  Future<Unit> add(int id) async {
    await Dio().post("$API_BASE/api/vaccine", data: id);
    return unit;
  }

  @override
  Future<List<Vaccine>> find() async {
    var response = await Dio().get("$API_BASE/api/vaccine");
    List<Vaccine> list = [];
    response.data.forEach((d) {
      list.add(Vaccine(id: d['id'], name: d['name'], code: d['code']));
    });
    
    return list;
  }

  @override
  Future<Unit> delete(List list) async {
    await Dio().delete("$API_BASE/api/vaccine");
    return unit;
  }

    @override 
  Future<List<Vaccine>> search(String name) async {
    var response = await Dio().get("$API_BASE/api/search/vaccine/$name");
    List<Vaccine> list= [];
    response.data.forEach((d) => {
      list.add(Vaccine(id: d['id'],name : d['name'],code:d["code"]))
    });
    return list;
  }
}
