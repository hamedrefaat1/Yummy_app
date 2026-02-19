import 'package:dio/dio.dart';
import 'package:yummy/core/utils/local_storage.dart';

class DioClient {

final Dio _dio= Dio(
   BaseOptions(
    baseUrl: "https://sonic-zdi0.onrender.com/api",
    headers: {
      "Content-Type": "application/json",

    }
    )
);



 DioClient(){
      _dio.interceptors.add(
        InterceptorsWrapper(
           onRequest:(options, handler) async{
             final token = await PrefStorage.getToken();
             if(token !=null && token.isNotEmpty){
             options.headers["Authorization"] = "Bearer $token";
             }
              return handler.next(options);
           },
        )
      );
 }
 Dio get dio => _dio;

}
