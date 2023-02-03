
import '../export.dart';

class VehicleListResponseModel {
  List<VehicleDataModel>? data;

  VehicleListResponseModel({this.data});

  VehicleListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VehicleDataModel>[];
      json['data'].forEach((v) {
        data!.add(new VehicleDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}