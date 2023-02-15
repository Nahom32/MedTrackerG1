import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldmedicalcenter/data/data%20sources/implementations/diagnoses_data_source.dart';

import '../../../domain/models/NormalModel.dart';
import 'DiagnosesEvent.dart';
import 'DiagnosesState.dart';

class DiagnosesBloc extends Bloc<DiagnosesEvent, DiagnosesState> {
  final DignosesDataSources diagnosesRepo = DignosesDataSources();
  DiagnosesBloc() : super(Idle()) {
    on<LoadDiagnoses>(_loadDiagnoses);
    on<DeleteDiagnoses>(_deleteDiagnoses);
    on<SearchDiagnoses>(_searchDiagnoses);
  }

  List<NormalModel> testData = [
    NormalModel(userId: "1", id: "DMXC004", name: "Diagnoses100"),
    NormalModel(userId: "1", id: "DMXC005", name: "Diagnoses200"),
    NormalModel(userId: "1", id: "DMXC006", name: "Diagnoses300"),
    NormalModel(userId: "1", id: "DMXC003", name: "Diagnoses400"),
    NormalModel(userId: "1", id: "DMXC002", name: "Diagnoses500"),
    NormalModel(userId: "1", id: "DMXC001", name: "Diagnoses600"),
    NormalModel(userId: "1", id: "DMXC003", name: "Diagnoses400"),
    NormalModel(userId: "1", id: "DMXC002", name: "Diagnoses500"),
    NormalModel(userId: "1", id: "DMXC001", name: "Diagnoses600"),
    NormalModel(userId: "1", id: "DMXC003", name: "Diagnoses400"),
    NormalModel(userId: "1", id: "DMXC002", name: "Diagnoses500"),
    NormalModel(userId: "1", id: "DMXC001", name: "Diagnoses600"),
  ];

  FutureOr<void> _loadDiagnoses(
      LoadDiagnoses event, Emitter<DiagnosesState> emit) {
    emit(LoadingDiagnoses());
    //fetch here
    // emit(LoadingDiagnoses());
    // final response = await diagnosesRepo.find(event.id);
    // List<NormalModel> modified = [];
    // for (Diagnoses diagnoses in response){
    //   modified.add(NormalModel(userId: diagnoses.id, id: diagnoses.code, name: diagnoses.name));
    // }
    // emit(LoadedDiagnoses(allergies: modified));
    //end
    emit(LoadedDiagnoses(diagnoses: testData));
  }

  FutureOr<void> _deleteDiagnoses(
      DeleteDiagnoses event, Emitter<DiagnosesState> emit) {
    emit(LoadingDiagnoses());
    for (NormalModel item in event.diagnoses) {
      // await diagnosesRepo.delete(item.id!);
      testData.remove(item);
    }
    emit(LoadedDiagnoses(diagnoses: testData));
  }

  FutureOr<void> _searchDiagnoses(
      SearchDiagnoses event, Emitter<DiagnosesState> emit) {
    emit(LoadingDiagnoses());
    // final response = await diagnosesRepo.find(event.name);
    // List<NormalModel> modified = [];
    // for (diagnoses diagnoses in response){
    //   modified.add(NormalModel(userId: diagnoses.id, id: diagnoses.code, name: diagnoses.name));
    // }
    // emit(Loadeddiagnoses(allergies: modified));
  }
}
