
import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/PersonalInfo.dart';

import '../../../core/error/failures.dart';
import '../../models/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, PersonalInfo>> createAuth(Auth auth);
 
}