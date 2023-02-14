

import '../../../domain/models/NormalModel.dart';

abstract class DiagnosesEvent {}

class AddDiagnoses extends DiagnosesEvent {
  final NormalModel newDiagnoses;

  AddDiagnoses(this.newDiagnoses);
}

class LoadDiagnoses extends DiagnosesEvent {
  final String id;

  LoadDiagnoses(this.id);
}

class DeleteDiagnoses extends DiagnosesEvent {
  final List<NormalModel> diagnoses;

  DeleteDiagnoses(this.diagnoses);
}
