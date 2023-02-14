import 'package:equatable/equatable.dart';
import 'package:worldmedicalcenter/domain/models/user.dart';

class Documents extends Equatable {
  final String id;
  final String name;
  final String code;

  const Documents({
    required this.id,
    required this.name,
    required this.code,
  });

  @override
  List<Object> get props {
    return [id, name,code];
  }
}
