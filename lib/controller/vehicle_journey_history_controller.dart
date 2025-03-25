import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyHistoryModel/vehicle_journey_history_model.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyHistoryModel/vehicle_journey_history_update_model.dart';
import 'package:municipality_car_management_system/services/dependency_services.dart';

class VehicleJourneyHistoryController {
  final dio = getIt<Dio>();

  /// get vehicle journey history list
  Future<VehicleJourneyHistroryApiResModel> getVehicleJourneyHistoryList(
      {required BuildContext context}) async {
    VehicleJourneyHistroryApiResModel vehicleJourneyHistroryApiResModel =
        VehicleJourneyHistroryApiResModel();
    try {
      final response = await dio.request(
        'vehicle-journey-history.php',
        options: Options(
          method: 'GET',
        ),
      );
      vehicleJourneyHistroryApiResModel =
          VehicleJourneyHistroryApiResModel.fromJson(response.data);
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
      debugPrint('Vehicle Journey History Api Error: $e');
    }
    return vehicleJourneyHistroryApiResModel;
  }

  /// update return value
  Future<VehicleJourneyReturnUpdateApiResModel>
      getUpdateVehicleJourneyHistoryReturn(
          {required BuildContext context, required id}) async {
    VehicleJourneyReturnUpdateApiResModel
        vehicleJourneyReturnUpdateApiResModel =
        VehicleJourneyReturnUpdateApiResModel();
    var data = json.encode({"id": id});
    try {
      final response = await dio.request(
        'update-vehicle-data-submit.php',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );
      vehicleJourneyReturnUpdateApiResModel =
          VehicleJourneyReturnUpdateApiResModel.fromJson(response.data);
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
      debugPrint('Vehicle Journey History Return Api Error: $e');
    }
    return vehicleJourneyReturnUpdateApiResModel;
  }
}
