import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<RemoteFailure, LoginEntity>> login(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected) {
      try {
        final login = await remoteDataSource.login(body);
        return Right(login);
      } on RemoteException catch (e) {
        return Left(RemoteFailure(statusCode: e.statusCode, message: e.message));
      }
    } else {
      return const Left(RemoteFailure(statusCode: 12163, message: 'No internet connection.'));
    }
  }
}
