import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  final String? userId;
  final String userName;
  final String emailAddress;
  final String date;

  const User({
    this.userId,
    required this.userName,
    required this.emailAddress,
    required this.date,
  });

  dynamic toJson() => {
        'userID': userId,
        'userName': userName,
        'emailAddress': emailAddress,
        'date': date,
      };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object> get props {
    return [userName, emailAddress, date];
  }
}
