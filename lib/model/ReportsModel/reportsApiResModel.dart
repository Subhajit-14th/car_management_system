class ReportsApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  ReportsApiResModel({this.msg, this.status, this.record});

  ReportsApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? date;
  String? count;

  Record({this.id, this.vehicleNo, this.driverName, this.date, this.count});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleNo = json['vehicle_no'];
    driverName = json['driver_name'];
    date = json['date'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vehicle_no'] = vehicleNo;
    data['driver_name'] = driverName;
    data['date'] = date;
    data['count'] = count;
    return data;
  }
}
