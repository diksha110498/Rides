import 'package:rides/export.dart';
import 'package:dio/dio.dart' as Dio;
class AuthRequestModel {
  static imageListRequestModel({var useId,
    var offset,
    var type,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = useId;
    data['offset'] = offset;
    data['type'] = type;
    return data;
  }
  static postImageRequestModel({
    var firstName,
    var lastName,
    var email,
    var phoneNumber,
    Dio.MultipartFile ? imageFile,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phoneNumber;
    data['user_image'] = imageFile;
    return data;
  }
}