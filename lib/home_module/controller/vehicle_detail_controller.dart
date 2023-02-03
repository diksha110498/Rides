import 'package:rides/export.dart';

class VehicleDetailController extends GetxController {
  Rx<VehicleDataModel> vehicleDataModel = VehicleDataModel().obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      vehicleDataModel.value = Get.arguments['data'];
    }
    super.onInit();
  }

  double getCarbonUnit() {
    double carbonUnit = 0.0;
    int newKiloMetrage = vehicleDataModel.value.kilometrage;
    List<int> kilometrage = [];
    List<double> carbonUnits = [];

    //if kilometrage is less than 5000
    if (vehicleDataModel.value.kilometrage <= 5000) {
      carbonUnit = 1.0;
    } else {
      //calculate how many kilpmetrage present per 5000
      var data = (newKiloMetrage / 5000).toInt();
      for (int i = 0; i < data; i++) {
        newKiloMetrage = newKiloMetrage - 5000;
        kilometrage.add(newKiloMetrage);
      }
    }
    if (kilometrage.length != 0) {
      //calculate catbonunit for first add 1/km and for further add 1.5/km
      kilometrage.forEach((element) {
        if (element <= 5000) {
          carbonUnits.add(1 * 5000);
        } else {
          carbonUnits.add(1.5 * 5000);
        }
      });
    }
    if (carbonUnits.length != 0) {
      //calculate carbon units.
      carbonUnits.forEach((element) {
        carbonUnit = carbonUnit + double.parse(element.toString());
      });
    }

    return carbonUnit;
  }
}
