import 'package:worldmedicalcenter/models/NormalModel.dart';

abstract class AllergyEvent {}

class AddAllergy extends AllergyEvent {
  final NormalModel newAllergy;

  AddAllergy(this.newAllergy);
}

class LoadAllergy extends AllergyEvent {
  final int id;

  LoadAllergy(this.id);
}

class DeleteAllergy extends AllergyEvent {
  final List<NormalModel> allergies;

  DeleteAllergy(this.allergies);
}
