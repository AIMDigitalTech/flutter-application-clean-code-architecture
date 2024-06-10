import 'package:dartz/dartz.dart';

import '../entities/login_request.dart';

abstract class LoginRepository {
  Future<Either<Exception, bool>> makeLoginRequest(LoginRequest loginRequest);
}
