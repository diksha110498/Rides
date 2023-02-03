import '../../export.dart';

class HomeScreen extends StatelessWidget {
  var controller = Get.find<HomeController>();
 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Rides", style: textStyleBold()),
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: _inputField(),
        ),
        _button(),
        Expanded(child: _rideList())
      ],
    ).paddingAll(20.0);
  }
  _inputField()
  {
    return Obx(() => TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      maxLength: 3,
      onChanged: (value)
      {
        if(value.length<1)
          {
            controller.showData.value=false;
          }
      },
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      controller: controller.textEditingController!.value,
      decoration: InputDecoration(
        hintText: "Enter Limit",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Limit can't be empty";
        } else if (int.parse(value)<1 ||int.parse(value)>100) {
          return "Limit should be in range between 1-100";
        }
      },
    ).paddingOnly(bottom: 20.0));
  }
  _button()
  {
    return   ElevatedButton(
        onPressed: () {
        if(_formKey.currentState!.validate())
          {
            controller.showData.value=false;
            Get.focusScope!.unfocus();
            controller.future= controller.hitApiToGetRidesList();
            controller.showData.value=true;

          }
        },
        child: Text("Submit")).paddingOnly(bottom: 20.0);
  }


  _rideList() {
    return Obx(() => Visibility(
        visible: controller.showData.value,
        child: FutureBuilder(
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                return _listView();
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator());
              default:
                return Center(child: CircularProgressIndicator());
            }
          },
          future: controller.future,
        )));
  }
  _listView()
  {
    return Obx(() =>controller.vehicleList.value!=null && controller.vehicleList.value.length!=0?
    RefreshIndicator(
        onRefresh: controller.refreshRides,
        child:ListView.separated(

        padding: EdgeInsets.all(height_20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.toNamed(homeDetailRoute,arguments: {"data":controller.vehicleList.value[index]
              });
            },

            child: Card(
              child: Column(
                children: [
                  Text(controller.vehicleList[index].vin.toString(),style: textStyleBold()).paddingOnly(
                      bottom: 20.0
                  ),
                  Text(controller.vehicleList[index].makeAndModel.toString(),style: textStyleBold()).paddingOnly(
                      bottom: 20.0
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: height_20);
        },
        itemCount: controller.vehicleList.value.length )):Center(
      child: Text("No data found",style: textStyle()),
    ));
  }

}
