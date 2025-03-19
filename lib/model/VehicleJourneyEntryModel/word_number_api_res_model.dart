class WordNumberApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  WordNumberApiResModel({this.msg, this.status, this.record});

  WordNumberApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? wardno;

  Record({this.id, this.wardno});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wardno = json['wardno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['wardno'] = wardno;
    return data;
  }
}
