import 'package:worldmedicalcenter/models/AllergyModel.dart';

abstract class AllergyEvent {}

class AddAllergy extends AllergyEvent {
  final AllergyModel newAllergy;

  AddAllergy(this.newAllergy);
}

class LoadAllergy extends AllergyEvent {
  final int id;

  LoadAllergy(this.id);
}

class DeleteAllergy extends AllergyEvent {
  final List<AllergyModel> allergies;

  DeleteAllergy(this.allergies);
}
