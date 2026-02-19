import 'package:dio/dio.dart';
import 'package:yummy/core/networks/api_errors.dart';
import 'package:yummy/core/networks/api_exceptions.dart';
import 'package:yummy/core/networks/api_services.dart';
import 'package:yummy/core/utils/local_storage.dart';
import 'package:yummy/features/auth/data/user_model.dart';

class AuthRepo {
  ApiServices apiServices = ApiServices();

  // login method
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiServices.post("/login", {
        "email": email,
        "password": password,
      });

      if (response is Response) {
        final data = response.data;

        if (data["code"] != 200) {
          throw ApiErrors(message: data["message"]);
        }

        final user = UserModel.fromJason(data["data"]);

        if (user.token != null) {
          PrefStorage.setToken(user.token!);
        }

        return user;
      } else {
        throw ApiErrors(message: "Invalid response from server");
      }
    } on DioException catch (e) {
      final serverMessage = e.response?.data?["message"];

      if (serverMessage != null) {
        throw ApiErrors(message: serverMessage);
      }

      throw ApiExceptions.handleError(e);
    }
  }

  /// Signup method
  Future<UserModel> signUp(String name, String email, String password) async {
    try {
      final response = await apiServices.post("/register", {
        "name": name,
        "email": email,
        "password": password,
      });
      if (response is Response) {
        final data = response.data;
        final user = UserModel.fromJason(data["data"]);
        print("**********************$data********************");
        return user;
      } else {
        throw ApiErrors(message: "Invalid response from server");
      }
    } on DioException catch (e) {
      final serverMessage = e.response?.data?["message"];
      if (serverMessage != null) {
        throw ApiErrors(message: serverMessage);
      }
      throw ApiExceptions.handleError(e);
    }
  }

  /// get profile data 

  



  /// update profile data 
  
  
 
  ///  logout from app 
}
