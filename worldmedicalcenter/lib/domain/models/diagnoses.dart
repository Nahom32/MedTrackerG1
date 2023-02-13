import 'package:equatable/equatable.dart';

class Diagnoses extends Equatable {
  final String id;
  final String name;
  final String code;

  const Diagnoses({
    required this.id,
    required this.name,
    required this.code
  });

  @override
  List<Object> get props {
    return [id, name,code];
  }
}