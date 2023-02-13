import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../models/auth.dart';
import '../../models/user.dart';
import '../../repository/interfaces/auth_repository.dart';

abstract class CreateAuth {
  Future<Either<Failure, User>> execute(Auth auth);
}

class CreateAuthImpl implements CreateAuth {
  AuthRepository authRepository;
   CreateAuthImpl(this.authRepository);

  @override 
  Future<Either<Failure,User>> execute(Auth auth) async {
    final result = await authRepository.createAuth(auth);
    return result;
  }
}
