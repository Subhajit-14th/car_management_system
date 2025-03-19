import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      debugPrint('Workers api error: $e');
    }
    return workersNameApiResModel;
  }
}
