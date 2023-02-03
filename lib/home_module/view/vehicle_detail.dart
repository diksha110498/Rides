import '../../export.dart';
import '../controller/vehicle_detail_controller.dart';

class VehicleDetailScreen extends StatelessWidget {
  var controller = Get.find<VehicleDetailController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          centerTitle: true,
          title: Text("Test", style: textStyleBold()),
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(children: [_vehicleDetail(), _submit()]),
    ).paddingAll(20.0);
  }

  _vehicleDetail() {
    return Column(
      children: [
        _dataView("Vin:", controller.vehicleDataModel.value.vin),
        _dataView(
            "Make and Model:", controller.vehicleDataModel.value.makeAndModel),
        _dataView("Color:", controller.vehicleDataModel.value.color),
        _dataView("Car Type:", controller.vehicleDataModel.value.carType),
      ],
    );
  }

  _dataView(label, value) {
    return Row(
      children: [
        Text(label, style: textStyleBold())
            .paddingOnly(bottom: 20.0)
            .paddingOnly(right: 20.0),
        Expanded(
            child: Text(value ?? "", style: textStyle())
                .paddingOnly(bottom: 20.0)),
      ],
    );
  }

  _submit() {
    return ElevatedButton(
        onPressed: () {
          Get.bottomSheet(Container(

            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Text(
                "Estimated bottom sheet as per vehicles kilomterage is"
                    " ${controller.getCarbonUnit().toStringAsFixed(1)} unit.",
            style: textStyleBold()).paddingAll(20.0),
          ),backgroundColor: Colors.white,);
        },
        child: Text("Estimated Carbon Emission"));
  }
}
