import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_architecture/core/error/failures.dart';
import 'package:flutter_bloc_clean_architecture/domain/entities/login_entity.dart';

import '../../core/error/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, LoginEntity>> login(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected) {
      try {
        final login = await remoteDataSource.login(body);
        return Right(login);
      } on ValidationException catch (e) {
        return Left(ValidationFailure(errors: e.errors, message: e.message));
      } on ServerException catch (e) {
        return Left(ServerFailure(statusCode: e.statusCode, message: e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
