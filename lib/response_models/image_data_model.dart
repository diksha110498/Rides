class VehicleDataModel {
  var id;
  var uid;
  var vin;
  var makeAndModel;
  var color;
  var transmission;
  var driveType;
  var fuelType;
  var carType;
  List<String>? carOptions;
  List<String>? specs;
  var doors;
  var mileage;
  var kilometrage;
  var licensePlate;

  VehicleDataModel(
      {this.id,
        this.uid,
        this.vin,
        this.makeAndModel,
        this.color,
        this.transmission,
        this.driveType,
        this.fuelType,
        this.carType,
        this.carOptions,
        this.specs,
        this.doors,
        this.mileage,
        this.kilometrage,
        this.licensePlate});

  VehicleDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    vin = json['vin'];
    makeAndModel = json['make_and_model'];
    color = json['color'];
    transmission = json['transmission'];
    driveType = json['drive_type'];
    fuelType = json['fuel_type'];
    carType = json['car_type'];
    carOptions = json['car_options'].cast<String>();
    specs = json['specs'].cast<String>();
    doors = json['doors'];
    mileage = json['mileage'];
    kilometrage = json['kilometrage'];
    licensePlate = json['license_plate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['vin'] = this.vin;
    data['make_and_model'] = this.makeAndModel;
    data['color'] = this.color;
    data['transmission'] = this.transmission;
    data['drive_type'] = this.driveType;
    data['fuel_type'] = this.fuelType;
    data['car_type'] = this.carType;
    data['car_options'] = this.carOptions;
    data['specs'] = this.specs;
    data['doors'] = this.doors;
    data['mileage'] = this.mileage;
    data['kilometrage'] = this.kilometrage;
    data['license_plate'] = this.licensePlate;
    return data;
  }
}