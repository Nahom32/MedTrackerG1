import 'package:worldmedicalcenter/models/NormalModel.dart';

abstract class DiagnosesEvent {}

class AddDiagnoses extends DiagnosesEvent {
  final NormalModel newDiagnoses;

  AddDiagnoses(this.newDiagnoses);
}

class LoadDiagnoses extends DiagnosesEvent {
  final int id;

  LoadDiagnoses(this.id);
}

class DeleteDiagnoses extends DiagnosesEvent {
  final List<NormalModel> diagnoses;

  DeleteDiagnoses(this.diagnoses);
}
