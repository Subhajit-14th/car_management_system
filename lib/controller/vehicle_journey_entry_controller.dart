import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/driver_name_api_res_model.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/vehicle_data_submit_api_res_model.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/vehicle_number_api_res_model.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/word_number_api_res_model.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/workers_name_api_res_model.dart';
import 'package:municipality_car_management_system/services/dependency_services.dart';

class VehicleJourneyEntryController {
  final dio = getIt<Dio>();

  /// Get vehicle number list
  Future<VehicleNumberApiResModel> vehicleNumber(
      {required BuildContext context}) async {
    VehicleNumberApiResModel vehicleNumberApiResModel =
        VehicleNumberApiResModel();
    try {
      final response = await dio.request(
        'vehicle-list.php',
        options: Options(
          method: 'GET',
        ),
      );
      vehicleNumberApiResModel =
          VehicleNumberApiResModel.fromJson(response.data);
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
      debugPrint('My vehicle number api error: $e');
    }
    return vehicleNumberApiResModel;
  }

  /// Get word No List
  Future<WordNumberApiResModel> getWordNumberList(
      {required BuildContext context}) async {
    WordNumberApiResModel wordNumberApiResModel = WordNumberApiResModel();
    try {
      final response = await dio.request(
        'wardno-list.php',
        options: Options(
          method: 'GET',
        ),
      );
      wordNumberApiResModel = WordNumberApiResModel.fromJson(response.data);
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
      debugPrint('Word Number api error: $e');
    }
    return wordNumberApiResModel;
  }

  /// Get Workers Name
  Future<WorkersNameApiResModel> getWorkersName(
      {required BuildContext context}) async {
    WorkersNameApiResModel workersNameApiResModel = WorkersNameApiResModel();
    try {
      final response = await dio.request(
        'workers-list.php',
        options: Options(
          method: 'GET',
        ),
      );
      workersNameApiResModel = WorkersNameApiResModel.fromJson(response.data);
    } on PlatformException catch (e) {
      debugPrint('Platfrom Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Platfrom Error: $e"),
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
      debugPrint('Workers api error: $e');
    }
    return workersNameApiResModel;
  }

  /// Get driver name
  Future<DriverNameApiResModel> getDriverName(
      {required BuildContext context}) async {
    DriverNameApiResModel driverNameApiResModel = DriverNameApiResModel();
    try {
      final response = await dio.request(
        'drivername-list.php',
        options: Options(
          method: 'GET',
        ),
      );
      driverNameApiResModel = DriverNameApiResModel.fromJson(response.data);
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Platfrom Error: $e'),
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
      debugPrint('Driver Name api error: $e');
    }
    return driverNameApiResModel;
  }

  /// submit button
  Future<VehicleDataSubmitApiResModel> submitVehicleData(
      {required BuildContext context,
      required String vehicleNoId,
      required String driverNameId,
      required String wardNoId,
      required String workersNameId}) async {
    VehicleDataSubmitApiResModel vehicleDataSubmitApiResModel =
        VehicleDataSubmitApiResModel();
    var data = FormData.fromMap({
      'vehicle_no_id': vehicleNoId,
      'driver_name_id': driverNameId,
      'ward_no_id': wardNoId,
      'workers_name_id': workersNameId,
    });
    try {
      final response = await dio.request(
        'vehicle-data-submit-api.php',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );
      debugPrint('My response is: ${response.data}');
      vehicleDataSubmitApiResModel =
          VehicleDataSubmitApiResModel.fromJson(response.data);
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Platfrom Error: $e'),
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
      debugPrint('Vehicle data submit api error: $e');
    }
    return vehicleDataSubmitApiResModel;
  }
}
