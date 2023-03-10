import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/NormalModel.dart';
import 'MedicineEvent.dart';
import 'MedicineState.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc() : super(Idle()) {
    on<LoadMedicine>(_loadMedicines);
    on<DeleteMedicine>(_deleteMedicines);
  }

  List<NormalModel> testData = [
    NormalModel(userId: "1", id: "MWXC0040", name: "Medicine10"),
    NormalModel(userId: "2", id: "MWXC0050", name: "Medicine20"),
    NormalModel(userId: "3", id: "MWXC0060", name: "Medicine30"),
    NormalModel(userId: "1", id: "MWXC0030", name: "Medicine40"),
    NormalModel(userId: "1", id: "MWXC0020", name: "Medicine50"),
    NormalModel(userId: "1", id: "MWXC0010", name: "Medicine60"),
    NormalModel(userId: "1", id: "MWXC0030", name: "Medicine40"),
    NormalModel(userId: "1", id: "MWXC0020", name: "Medicine50"),
    NormalModel(userId: "1", id: "MWXC0010", name: "Medicine60"),
  ];

  _loadMedicines(LoadMedicine event, Emitter<MedicineState> emit) {
    emit(LoadingMedicine());
    Future.delayed(Duration(seconds: 5));
    emit(LoadedMedicine(medicines: testData));
  }

  _deleteMedicines(DeleteMedicine event, Emitter<MedicineState> emit) {
    emit(LoadingMedicine());
    for (NormalModel item in event.medicines) {
      testData.remove(item);
    }
    emit(LoadedMedicine(medicines: testData));
  }
}
