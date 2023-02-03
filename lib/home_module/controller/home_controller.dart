import 'package:rides/api_repository.dart';
import 'package:rides/home_module/widget/common_widget.dart';
import '../../export.dart';

class HomeController extends GetxController {
  Rx<VehicleListResponseModel> vehicleListResponseModel =
      VehicleListResponseModel().obs;
  RxList<VehicleDataModel> vehicleList=RxList.empty();
  Future? future;
  RxBool showData=RxBool(false);
  Rx<TextEditingController> ?textEditingController;
  ScrollController scrollController = new ScrollController();

  @override
  void onInit() {
    textEditingController=TextEditingController().obs;
    super.onInit();
  }
  Future<Null> refreshRides() async{
    hitApiToGetRidesList();
  }
  hitApiToGetRidesList() async {
    await ApiRepository().getRidesApiCall(textEditingController!.value.text.trim()).then((value) {
      if (value != null) {
        vehicleListResponseModel.value = value;
       if(vehicleListResponseModel.value!=null)
         {
           vehicleList.value=vehicleListResponseModel.value.data!;
         }
      }
      vehicleList.sort((a, b) => a.vin.compareTo(b.vin));

      vehicleList.refresh();
    }).onError((error, stackTrace) {
      debugPrint("error ${error}");
      toast(error.toString());
    });
  }

}

