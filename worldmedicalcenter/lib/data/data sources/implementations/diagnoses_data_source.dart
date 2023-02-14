// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/diagnoses.dart';
import '../interfaces/diagnoses_data.dart';

const String API_BASE = "http://localhost:5260";

class DignosesDataSources implements DiagnosesData {
  @override
  Future<Unit> add(int id) async {
    await Dio().post("$API_BASE/api/diagnoses",  data:  id);
    return unit;
  }

  @override
  Future<List<Diagnoses>> find() async {
    var response = await Dio().get("$API_BASE/api/diagnoses");
    List<Diagnoses> list = [];
    response.data.forEach((d) => {
      list.add(Diagnoses(id: d["id"], name: d["name"], code: d["code"]))
    });
    
    return list;
  }

  @override
  Future<Unit> delete(List list) async {
    await Dio().post("$API_BASE/api/diagnoses",data: list);
    return unit;
  }
  @override 
  Future<List<Diagnoses>> search(String name) async {
    var response = await Dio().get("$API_BASE/api/search/diagnoses/$name");
    List<Diagnoses> list= [];
    response.data.forEach((d) => {
      list.add(Diagnoses(id: d['id'],name : d['name'],code:d["code"]))
    });
    return list;
  }

}
