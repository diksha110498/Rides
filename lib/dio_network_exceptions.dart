import 'dart:io';
import 'package:dio/dio.dart';

class DioNetworkExceptions {
  static String messageData = "";

  static getDioException(error) {
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              return messageData = "Request Cancelled";
            case DioErrorType.connectTimeout:
              return messageData = "Connection TimeOut";
            case DioErrorType.other:
              return messageData = "Connection TimeOut";
            case DioErrorType.receiveTimeout:
              return messageData ="Others";
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                return messageData="Error";
                case 401:
                  return messageData="UnAuthorised";
                case 403:
                  return messageData="UnAuthorised";
                case 404:
                  return messageData="Page Not found";
                case 500:
                  return messageData="Interal server error";
                default:
                  return messageData ="Something is wrong";
              }
            case DioErrorType.sendTimeout:
              return messageData ="TimeOut";
          }
        } else if (error is SocketException) {
          return messageData = "Socket Exception";
        } else {
          return messageData = "UnExpected Exception";
        }
      } on FormatException catch (_) {
        return messageData = "Format Exception";
      } catch (_) {
        return messageData ="UnExpected Exception";
      }
    }
  }
}
