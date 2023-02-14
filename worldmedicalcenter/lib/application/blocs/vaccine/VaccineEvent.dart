
import '../../../domain/models/NormalModel.dart';

abstract class VaccineEvent {}

class AddVaccine extends VaccineEvent {
  final NormalModel newVaccine;

  AddVaccine(this.newVaccine);
}

class LoadVaccine extends VaccineEvent {
  final String id;

  LoadVaccine(this.id);
}

class DeleteVaccine extends VaccineEvent {
  final List<NormalModel> vaccines;

  DeleteVaccine(this.vaccines);
}
