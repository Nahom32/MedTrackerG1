// import 'package:dartz/dartz.dart';
// import 'package:worldmedicalcenter/domain/models/PersonalInfo.dart';

// import '../../../core/error/failures.dart';
// import '../../../data/data sources/implementations/auth_data_source.dart';
// import '../../models/auth.dart';
// import '../interfaces/auth_repository.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   AuthDataSource authDataSource;
//   AuthRepositoryImpl(this.authDataSource);

//   @override
//   Future<Either<Failure, PersonalInfo>> createAuth(Auth auth) async {
//     try {
//       final result = await authDataSource.create(
//           Auth(emailAddress: auth.emailAddress, password: auth.password));
//       return Right(result);
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }
// }
