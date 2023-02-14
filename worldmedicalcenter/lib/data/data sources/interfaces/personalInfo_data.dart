
import 'package:worldmedicalcenter/domain/models/PersonalInfo.dart';

abstract class PersonalInfoData {
  Future<PersonalInfo> find();
  Future<PersonalInfo> edit(PersonalInfo personalInfo);

}
