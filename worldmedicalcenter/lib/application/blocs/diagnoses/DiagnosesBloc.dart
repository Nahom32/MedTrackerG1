import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/NormalModel.dart';
import 'DiagnosesEvent.dart';
import 'DiagnosesState.dart';

class DiagnosesBloc extends Bloc<DiagnosesEvent, DiagnosesState> {
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
    // emit(LoadingAllergy());
    // final response = await allergyRepo.find(event.id);
    // List<NormalModel> modified = [];
    // for (Allergy allergy in response){
    //   modified.add(NormalModel(userId: allergy.id, id: allergy.code, name: allergy.name));
    // }
    // emit(LoadedAllergy(allergies: modified));
    //end
    emit(LoadedDiagnoses(diagnoses: testData));
  }

  FutureOr<void> _deleteDiagnoses(
      DeleteDiagnoses event, Emitter<DiagnosesState> emit) {
    emit(LoadingDiagnoses());
    for (NormalModel item in event.diagnoses) {
      // await allergyRepo.delete(item.id!);
      testData.remove(item);
    }
    emit(LoadedDiagnoses(diagnoses: testData));
  }

  FutureOr<void> _searchDiagnoses(
      SearchDiagnoses event, Emitter<DiagnosesState> emit) {
    emit(LoadingDiagnoses());
    // final response = await allergyRepo.find(event.name);
    // List<NormalModel> modified = [];
    // for (Allergy allergy in response){
    //   modified.add(NormalModel(userId: allergy.id, id: allergy.code, name: allergy.name));
    // }
    // emit(LoadedAllergy(allergies: modified));
  }
}
