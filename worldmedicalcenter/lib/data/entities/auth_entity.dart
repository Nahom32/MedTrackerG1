import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String id;
  final String emailAddress;
  final String password;

  const AuthEntity({
    required this.id,
    required this.emailAddress,
    required this.password,
  });

  @override
  List<Object> get props {
    return [emailAddress, password];
  }
}
