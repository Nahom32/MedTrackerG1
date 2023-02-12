import 'package:equatable/equatable.dart';
import 'package:worldmedicalcenter/domain/models/user.dart';

class Allergy extends Equatable {
  final String allergyId;
  final String title;
  final User user;
  final String description;
  final String date;

  const Allergy({
    required this.allergyId,
    required this.user,
    required this.date,
    required this.description,
    required this.title,
  });

  @override
  List<Object> get props {
    return [allergyId, user, description, date,title];
  }
}
