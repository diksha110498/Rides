import 'dart:convert';

import 'package:rides/constants/endpoint.dart';
import 'package:rides/dio_network_exceptions.dart';
import 'package:rides/response_models/vehicle_list_response_model.dart';
import 'package:rides/response_models/success_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dioclient.dart';

class ApiRepository {
  Dio dio = Dio();
  DioClient? dioClient;

  ApiRepository() {
    dioClient = DioClient(dio, baseUrl);
  }

  Future<VehicleListResponseModel> getRidesApiCall(size) async {
    try {
      final response = await dioClient?.get(vehicleEndPoint,queryparameter: {
        "size":size
      } );
      Map<String,dynamic> map=new Map();
      map['data']=response!.data;
      debugPrint("===${map}");
      return VehicleListResponseModel.fromJson(map);
    } catch (e) {
      debugPrint("e ${DioNetworkExceptions.getDioException(e)}");
      return Future.error(DioNetworkExceptions.getDioException(e));;
    }
  }

}
