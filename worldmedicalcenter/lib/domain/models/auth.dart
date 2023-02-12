import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Auth extends Equatable {
  final String? id;
  final String emailAddress;
  final String password;

  const Auth({
    this.id,
    required this.emailAddress,
    required this.password,
  });

  dynamic toJson() => {
        'id': id,
        'emailAddress': emailAddress,
        'password': password,
      };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object> get props {
    return [emailAddress, password];
  }
}
