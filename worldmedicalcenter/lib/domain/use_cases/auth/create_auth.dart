import 'package:dartz/dartz.dart';
import 'package:worldmedicalcenter/domain/models/PersonalInfo.dart';
import '../../../core/error/failures.dart';
import '../../models/auth.dart';
import '../../repository/interfaces/auth_repository.dart';

abstract class CreateAuth {
  Future<Either<Failure, PersonalInfo>> execute(Auth auth);
}

class CreateAuthImpl implements CreateAuth {
  AuthRepository authRepository;
   CreateAuthImpl(this.authRepository);

  @override 
  Future<Either<Failure,PersonalInfo>> execute(Auth auth) async {
    final result = await authRepository.createAuth(auth);
    return result;
  }
}
