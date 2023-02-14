import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/NormalModel.dart';
import 'DiagnosesEvent.dart';
import 'DiagnosesState.dart';

class DiagnosesBloc extends Bloc<DiagnosesEvent, DiagnosesState> {
  DiagnosesBloc() : super(Idle()) {
    on<LoadDiagnoses>(_loadDiagnoses);
    on<DeleteDiagnoses>(_deleteDiagnoses);
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

  FutureOr<void> _loadDiagnoses(LoadDiagnoses event, Emitter<DiagnosesState> emit) {
    emit(LoadingDiagnoses());
    Future.delayed(Duration(seconds: 5));
    emit(LoadedDiagnoses(diagnoses: testData));
  }

  FutureOr<void> _deleteDiagnoses(
      DeleteDiagnoses event, Emitter<DiagnosesState> emit) {
    emit(LoadingDiagnoses());
    for (NormalModel item in event.diagnoses) {
      testData.remove(item);
    }
    emit(LoadedDiagnoses(diagnoses: testData));
  }
}
