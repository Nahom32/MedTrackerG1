// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/medcine.dart';

import '../interfaces/medicine_data.dart';


const String API_BASE =
    "https://b138-2a0d-5600-42-3000-00-27e8.ngrok.io/swagger/index.html";

class MedicineDataSources implements MedicineData {
  @override
  Future<Unit> add(int id) async {
    await Dio().post("$API_BASE/api/medicine", data: id);
    return unit;
  }

  @override
  Future<List<Medicine>> find(
  ) async {
    var response = await Dio().get("$API_BASE/api/medicine");
    List<Medicine> list = [];
    response.data.forEach((d) {
      list.add(Medicine(id: d['id'], name: d['name'], code: d['code']));
    });
    return list;
  }

  @override
  Future<Unit> delete(List list) async {
    await Dio().post("$API_BASE/api/search/medicine",data: list);
    return unit;
  }

    @override 
  Future<List<Medicine>> search(String name) async {
    var response = await Dio().get("$API_BASE/api/search/medicine/$name");
    List<Medicine> list= [];
    response.data.forEach((d) => {
      list.add(Medicine(id: d['id'],name : d['name'],code:d["code"]))
    });
    return list;
  }
}
