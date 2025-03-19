class VehicleNumberApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  VehicleNumberApiResModel({this.msg, this.status, this.record});

  VehicleNumberApiResModel.fromJson(Map<String, dynamic> json) {
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

  Record({this.id, this.vehicleNo});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleNo = json['vehicle_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vehicle_no'] = vehicleNo;
    return data;
  }
}
