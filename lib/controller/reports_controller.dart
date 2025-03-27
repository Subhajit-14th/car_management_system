import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:municipality_car_management_system/model/ReportsModel/reportDetailsApiResModel.dart';
import 'package:municipality_car_management_system/model/ReportsModel/reportsApiResModel.dart';
import 'package:municipality_car_management_system/services/dependency_services.dart';

class ReportsController {
  final dio = getIt<Dio>();

  /// Get report list
  Future<ReportsApiResModel> getReportsList(
      {required BuildContext context}) async {
    ReportsApiResModel reportsApiResModel = ReportsApiResModel();
    try {
      final response = await dio.request(
        'report-list-api.php',
        options: Options(
          method: 'GET',
        ),
      );
      reportsApiResModel = ReportsApiResModel.fromJson(response.data);
    } on PlatformException catch (e) {
      debugPrint('Platfrom Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Custom Snackbar"),
          backgroundColor: Colors.blueAccent,
          duration: Duration(seconds: 3),
        ),
      );
    } on DioException catch (e) {
      debugPrint('Dio Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Dio Exception: $e"),
          backgroundColor: Colors.blueAccent,
        ),
      );
    } catch (e) {
      debugPrint('Get reports api error: $e');
    }
    return reportsApiResModel;
  }

  /// get report details
  Future<ReportDetailsApiResModel> getReportDetails(
      {required BuildContext context, required String vehicleNo}) async {
    ReportDetailsApiResModel reportDetailsApiResModel =
        ReportDetailsApiResModel();
    print("API Response: $vehicleNo");
    var data = FormData.fromMap({'vehicle_no_id': vehicleNo});
    try {
      final response = await dio.request(
        'report-details-list.php',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );
      print("API Response: ${response.data}");
      reportDetailsApiResModel =
          ReportDetailsApiResModel.fromJson(response.data);
    } on PlatformException catch (e) {
      debugPrint('Platfrom Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Custom Snackbar"),
          backgroundColor: Colors.blueAccent,
          duration: Duration(seconds: 3),
        ),
      );
    } on DioException catch (e) {
      debugPrint('Dio Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Dio Exception: $e"),
          backgroundColor: Colors.blueAccent,
        ),
      );
    } catch (e) {
      debugPrint('Get reports details api error: $e');
    }
    return reportDetailsApiResModel;
  }
}
