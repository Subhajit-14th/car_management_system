import 'package:municipality_car_management_system/model/ReportsModel/reportsApiResModel.dart';

class ReportsFilterApiResModel {
  List<Record>? record;
  List<Record>? originalRecords; // ✅ Store original records for resetting
  int? status;

  ReportsFilterApiResModel({this.record, this.status}) {
    originalRecords = List.from(record ?? []);
  }
}
