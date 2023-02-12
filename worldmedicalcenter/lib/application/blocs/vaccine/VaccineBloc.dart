import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/NormalModel.dart';
import 'VaccineEvent.dart';
import 'VaccineState.dart';

class VaccineBloc extends Bloc<VaccineEvent, VaccineState> {
  VaccineBloc() : super(Idle()) {
    on<LoadVaccine>(_loadVaccines);
    on<DeleteVaccine>(_deleteVaccines);
  }

  List<NormalModel> testData = [
    NormalModel(userId: 1, id: 40, name: "Vaccine15"),
    NormalModel(userId: 2, id: 50, name: "Vaccine26"),
    NormalModel(userId: 3, id: 60, name: "Vaccine34"),
    NormalModel(userId: 1, id: 30, name: "Vaccine48"),
    NormalModel(userId: 1, id: 20, name: "Vaccine56"),
  ];

  _loadVaccines(LoadVaccine event, Emitter<VaccineState> emit) {
    emit(LoadingVaccine());
    Future.delayed(Duration(seconds: 5));
    emit(LoadedVaccine(vaccines: testData));
  }

  _deleteVaccines(DeleteVaccine event, Emitter<VaccineState> emit) {
    emit(LoadingVaccine());
    for (NormalModel item in event.vaccines) {
      testData.remove(item);
    }
    emit(LoadedVaccine(vaccines: testData));
  }
}
