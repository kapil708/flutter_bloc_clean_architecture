import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/login_entity.dart';

abstract class UserRepository {
  Future<Either<RemoteFailure, LoginEntity>> login(Map<String, dynamic> body);
}
