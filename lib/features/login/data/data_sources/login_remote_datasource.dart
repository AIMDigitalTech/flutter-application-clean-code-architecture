import 'package:dio/dio.dart';

import '../../../../core/const/network_constants.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_client.dart';
import '../../domain/repositories/login_repository.dart';
import '../models/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> makeLoginRequest(LoginRequest loginRequest);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final NetworkClient networkClient;

  LoginRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<LoginResponseModel> makeLoginRequest(LoginRequest loginRequest) async {
    Map<String, String>? params;
    Response response = await networkClient.invoke(kloginAPI, RequestType.post,
        queryParameters: params, requestBody: loginRequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LoginResponseModel.fromJson(response.data);
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
