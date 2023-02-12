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
    NormalModel(userId: 1, id: "WMXC0040", name: "Vaccine15"),
    NormalModel(userId: 2, id: "WMXC0050", name: "Vaccine26"),
    NormalModel(userId: 3, id: "WMXC0060", name: "Vaccine34"),
    NormalModel(userId: 1, id: "WMXC0030", name: "Vaccine48"),
    NormalModel(userId: 1, id: "WMXC0020", name: "Vaccine56"),
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
