
import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/user.dart';

import '../../../core/error/failures.dart';
import '../../models/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> createAuth(Auth auth);
 
}