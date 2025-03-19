class WorkersNameApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  WorkersNameApiResModel({this.msg, this.status, this.record});

  WorkersNameApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? workersname;

  Record({this.id, this.workersname});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workersname = json['workersname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['workersname'] = workersname;
    return data;
  }
}
