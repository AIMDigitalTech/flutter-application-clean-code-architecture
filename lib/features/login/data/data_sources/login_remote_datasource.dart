import 'package:dio/dio.dart';
import '../../../../core/const/network_constants.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/util/constant.dart';
import '../../domain/entities/login_request.dart';

abstract class LoginRemoteDataSource {
  Future<bool> makeLoginRequest(LoginRequest loginRequest);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final NetworkClient networkClient;

  LoginRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<bool> makeLoginRequest(LoginRequest loginRequest) async {
    Map<String, String>? params;
    Response response = await networkClient.invoke(
      kloginAPI,
      RequestType.post,
      queryParameters: params,
      requestBody: {
        'grant_type': grantTypePassword,
        'username': loginRequest.username,
        'password': loginRequest.password,
        'client_id': clientID,
        'scope': scope
      },
      headers: authHeader,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw ServerException(
        dioError: DioException(
            error: response,
            type: DioExceptionType.badResponse,
            requestOptions: response.requestOptions),
      );
    }
  }
}
