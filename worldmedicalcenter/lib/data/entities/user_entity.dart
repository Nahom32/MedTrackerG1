import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String userName;
  final String emailAddress;
  final String date;

  const UserEntity({
    this.userId,
    required this.userName,
    required this.emailAddress,
    required this.date
  });

  @override
  List<Object> get props {
    return [userName, emailAddress,date];
  }
}
