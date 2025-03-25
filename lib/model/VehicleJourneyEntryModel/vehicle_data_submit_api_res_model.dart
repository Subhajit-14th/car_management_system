class VehicleDataSubmitApiResModel {
  String? status;
  String? message;
  Data? data;

  VehicleDataSubmitApiResModel({this.status, this.message, this.data});

  VehicleDataSubmitApiResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? vehicleNoId;
  String? driverNameId;
  String? wardNoId;
  String? workersNameId;
  String? date;

  Data(
      {this.vehicleNoId,
      this.driverNameId,
      this.wardNoId,
      this.workersNameId,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    vehicleNoId = json['vehicle_no_id'];
    driverNameId = json['driver_name_id'];
    wardNoId = json['ward_no_id'];
    workersNameId = json['workers_name_id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicle_no_id'] = vehicleNoId;
    data['driver_name_id'] = driverNameId;
    data['ward_no_id'] = wardNoId;
    data['workers_name_id'] = workersNameId;
    data['date'] = date;
    return data;
  }
}
