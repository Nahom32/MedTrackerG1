import 'package:equatable/equatable.dart';

class Allergy extends Equatable {
  final int id;
  final String name;
  final String code;

  const Allergy({
    required this.id,
    required this.name,
    required this.code,
  });

  @override
  List<Object> get props {
    return [id, name,code];
  }
}
