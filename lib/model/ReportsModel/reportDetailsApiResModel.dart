class ReportDetailsApiResModel {
  String? msg;
  int? status;
  VehicleDetails? vehicleDetails;
  List<Record>? record;

  ReportDetailsApiResModel(
      {this.msg, this.status, this.vehicleDetails, this.record});

  ReportDetailsApiResModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    vehicleDetails = json['vehicle_details'] != null
        ? VehicleDetails.fromJson(json['vehicle_details'])
        : null;
    if (json['record'] != null) {
      record = <Record>[];
      json['record'].forEach((v) {
        record!.add(Record.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (vehicleDetails != null) {
      data['vehicle_details'] = vehicleDetails!.toJson();
    }
    if (record != null) {
      data['record'] = record!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehicleDetails {
  String? vehicleNo;
  int? tripCount;

  VehicleDetails({this.vehicleNo, this.tripCount});

  VehicleDetails.fromJson(Map<String, dynamic> json) {
    vehicleNo = json['vehicle_no'];
    tripCount = json['trip_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicle_no'] = vehicleNo;
    data['trip_count'] = tripCount;
    return data;
  }
}

class Record {
  String? tripNumber;
  String? id;
  String? vehicleNo;
  String? driverName;
  String? date;
  String? wardNo;
  String? workersName;

  Record(
      {this.tripNumber,
      this.id,
      this.vehicleNo,
      this.driverName,
      this.date,
      this.wardNo,
      this.workersName});

  Record.fromJson(Map<String, dynamic> json) {
    tripNumber = json['trip_number'];
    id = json['id'];
    vehicleNo = json['vehicle_no'];
    driverName = json['driver_name'];
    date = json['date'];
    wardNo = json['ward_no'];
    workersName = json['workers_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trip_number'] = tripNumber;
    data['id'] = id;
    data['vehicle_no'] = vehicleNo;
    data['driver_name'] = driverName;
    data['date'] = date;
    data['ward_no'] = wardNo;
    data['workers_name'] = workersName;
    return data;
  }
}
