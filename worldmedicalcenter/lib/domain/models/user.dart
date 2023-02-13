import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:worldmedicalcenter/domain/models/allergy.dart';
import 'package:worldmedicalcenter/domain/models/diagnoses.dart';
import 'package:worldmedicalcenter/domain/models/medcine.dart';
import 'package:worldmedicalcenter/domain/models/profile.dart';
import 'package:worldmedicalcenter/domain/models/vaccine.dart';

@immutable
class User extends Equatable {
  final String? userId;
  final String userName;
  final String emailAddress;
  final String date;
  final List<Allergy> allergies;
  final List<Medicine> medicines;
  final List<Diagnoses> diagnonses;
  final List<Vaccine> vaccines;
  final List<Profile> profiles;

  const User(
      {this.userId,
      required this.userName,
      required this.emailAddress,
      required this.date,
      required this.allergies,
      required this.medicines,
      required this.diagnonses,
      required this.vaccines,
      required this.profiles});

  // dynamic toJson() => {
  //       'userID': userId,
  //       'userName': userName,
  //       'emailAddress': emailAddress,
  //       'date': date,
  //     };

  // @override
  // String toString() {
  //   return toJson().toString();
  // }

  @override
  List<Object> get props {
    return [
      userName,
      emailAddress,
      date,
      allergies,
      medicines,
      diagnonses,
      vaccines,
      profiles
    ];
  }
}
