import 'package:dio/dio.dart';


class DioClient {
  final Dio _dio;
 final baseUrl;
  DioClient(this._dio,this.baseUrl) {
    _dio..options.baseUrl = baseUrl;
    _dio..options.responseType = ResponseType.json;
    _dio..options.headers={'Content-Type':'application/json;  charset=utf-8'};
  }

 Future<Response?> get(
    path,
  { Map<String,dynamic> ?queryparameter}
  ) async {
    try {
     Response respone= await _dio.get(path,
      queryParameters: queryparameter,
     options:Options(
       headers: {"Authorization":"Bearer "}
     ));
     return respone;
    } catch (e) {  rethrow;
    }

  }

  Future<dynamic> post(
      path,
      data,
  { Map<String,dynamic> ?queryparameter}
      ) async {
    try {
      var respone= await _dio.post(path,
          data: data,
          queryParameters: queryparameter);
      return respone;
    } catch (e) {  rethrow;
    }
  }

  Future<Response?> put(
      path,
      data,
      Map<String,dynamic> queryparameter
      ) async {
    try {
      Response respone= await _dio.put(path,
          data: path,
          options:Options(
            ///statically adding token or we can use GetStorage to save token after login.
              headers: {"Authorization":"Bearer"}
          ),
          queryParameters: queryparameter);
      return respone;
    } catch (e) {  rethrow;
    }
  }
}
