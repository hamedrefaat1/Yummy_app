import 'package:dio/dio.dart';
import 'package:yummy/core/networks/api_errors.dart';

class ApiExceptions {
  static ApiErrors handleError(DioException error) {
    switch (error.type) {
      ///  Server timeout
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiErrors(
          message: "Connection timeout. Please try again later.",
        );

      // No internet connection
      case DioExceptionType.connectionError:
        return ApiErrors(
          message: "No internet connection. Please check your network.",
        );

      //  Request cancelled
      case DioExceptionType.cancel:
        return ApiErrors(message: "Request was cancelled.");

      ///  Unknown error
      case DioExceptionType.unknown:
      default:
        return ApiErrors(message: "Something went wrong. Please try again.");
    }
  }
}
