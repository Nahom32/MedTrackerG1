import 'package:equatable/equatable.dart';
import 'package:worldmedicalcenter/domain/models/user.dart';

class UserAllergies extends Equatable {
  final String allergyId;
  final User user;
  final String title;
  final String description;
  final String date;

  const UserAllergies({
    required this.allergyId,
    required this.user,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  List<Object> get props {
    return [allergyId,title, description, date,user];
  }
}
