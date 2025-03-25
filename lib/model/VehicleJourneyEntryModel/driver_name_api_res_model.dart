class DriverNameApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  DriverNameApiResModel({this.msg, this.status, this.record});

  DriverNameApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? drivername;

  Record({this.id, this.drivername});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    drivername = json['drivername'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['drivername'] = drivername;
    return data;
  }
}
