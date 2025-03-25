class VehicleJourneyHistroryApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  VehicleJourneyHistroryApiResModel({this.msg, this.status, this.record});

  VehicleJourneyHistroryApiResModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
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
    if (record != null) {
      data['record'] = record!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Record {
  String? id;
  String? vehicleNo;
  String? driverName;
  String? wardNo;
  String? workersName;

  Record(
      {this.id,
      this.vehicleNo,
      this.driverName,
      this.wardNo,
      this.workersName});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleNo = json['vehicle_no'];
    driverName = json['driver_name'];
    wardNo = json['ward_no'];
    workersName = json['workers_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vehicle_no'] = vehicleNo;
    data['driver_name'] = driverName;
    data['ward_no'] = wardNo;
    data['workers_name'] = workersName;
    return data;
  }
}
