import 'package:dio/dio.dart';
import 'package:la_vie/shared/network/remote/end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: BaseURL,
          receiveDataWhenStatusError: true,
       ),
    );
  }

  static Future<Response> getDate({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.get(url, queryParameters: data!,);


  }
  //
  // static Future<Response> searchDate({
  //   required String url,
  //   required Map<String, dynamic> query,
  // }) async {
  //   return await dio.post(url, queryParameters: query,);
  // }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.post(url, data: data!,);
  }




  // static Future<Response> putData({
  //   required String url,
  //   required Map<String, dynamic> data,
  //   Map<String, dynamic>? query,
  //
  //   String? token,
  // }) async
  // {
  //   dio.options.headers =
  //   {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': token??'',
  //   };
  //
  //   return dio.put(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }
}
