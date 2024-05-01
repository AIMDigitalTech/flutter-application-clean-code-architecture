import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../error/exception.dart';

abstract class BaseCubit<State> extends BlocBase<State> {
  /// {@macro cubit}
  BaseCubit(super.initialState);

  String handleException(Exception exception) {
    var message = "";
    if (exception is ServerException) {
      return handleDioError(exception.dioError);
    } else if (exception is NoInternetException) {
      message = "No internet connection available";
    } else {
      message = "An Exception has occurred";
    }

    log("Cubit response.fold left: $message");
    return message;
  }

  handleDioError(DioException dioError) {
    String message = "";
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout";
        break;
      case DioExceptionType.unknown:
        message = "Connection failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection";
        break;
      case DioExceptionType.badResponse:
        {
          if (dioError.response?.statusCode == 204) {
          } else if (dioError.response?.statusCode == 400) {
            // BadRequestException
            message = "BadRequestException";
          } else if (dioError.response?.statusCode == 401) {
            // UnauthorisedException
            message = "UnauthorisedException";
          } else if (dioError.response?.statusCode == 403) {
            // ForbiddenException
            message = "ForbiddenException";
          } else if (dioError.response?.statusCode == 500) {
            // ServerException
            message = "ServerException";
          } else {
            message =
                "Received invalid status code: ${dioError.response?.statusCode}";
          }
        }
        break;
      case DioExceptionType.sendTimeout:
        message = "Receive timeout in send request";
        break;
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      // TODO: Handle this case.
    }
    return message;
  }
}
