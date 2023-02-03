

import 'package:rides/home_module/controller/vehicle_detail_controller.dart';

import '../../export.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => VehicleDetailController());
  }

}