import '../../../domain/models/PersonalInfo.dart';

abstract class PersonalInfoEvent{}

class SaveEvent extends PersonalInfoEvent{
  
  final PersonalInfo newInfo;

  SaveEvent(this.newInfo);

}