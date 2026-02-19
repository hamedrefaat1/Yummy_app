import 'package:dio/dio.dart';
import 'package:yummy/core/networks/api_exceptions.dart';
import 'package:yummy/core/networks/dio_client.dart';

class ApiServices {
  DioClient dioClient = DioClient();

  // get method
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await dioClient.dio.get(endPoint);
      return response;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    }
  }

  // post method
  Future<dynamic> post(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await dioClient.dio.post(endPoint, data: body);

      return response;
    } on DioException {
      rethrow;
    }
  }

  // put or update method
  Future<dynamic> put(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await dioClient.dio.put(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  // delete method
  Future<dynamic> delete(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await dioClient.dio.delete(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
