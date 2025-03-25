import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/controller/vehicle_journey_history_controller.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyHistoryModel/vehicle_journey_history_model.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyHistoryModel/vehicle_journey_history_update_model.dart';

class VehicleJourneyHistoryProvider extends ChangeNotifier {
  VehicleJourneyHistroryApiResModel _vehicleJourneyHistroryApiResModel =
      VehicleJourneyHistroryApiResModel();

  VehicleJourneyHistroryApiResModel get vehicleJourneyHistroryApiResModel =>
      _vehicleJourneyHistroryApiResModel;

  final VehicleJourneyHistoryController _vehicleJourneyHistoryController =
      VehicleJourneyHistoryController();

  bool _isDataLoading = false;
  bool get isDataLoading => _isDataLoading;

  /// get vehicle history data
  void getVehicleHistory(context) async {
    _isDataLoading = true;
    notifyListeners();

    _vehicleJourneyHistroryApiResModel = await _vehicleJourneyHistoryController
        .getVehicleJourneyHistoryList(context: context);

    if (_vehicleJourneyHistroryApiResModel.status == 200) {
      _isDataLoading = false;
    } else {
      _isDataLoading = false;
    }
    notifyListeners();
  }

  VehicleJourneyReturnUpdateApiResModel vehicleJourneyReturnUpdateApiResModel =
      VehicleJourneyReturnUpdateApiResModel();

  /// update vehicle history
  void updateVehicleHistory(context, id, vehicleNumber) async {
    vehicleJourneyReturnUpdateApiResModel =
        await _vehicleJourneyHistoryController
            .getUpdateVehicleJourneyHistoryReturn(context: context, id: id);
    if (vehicleJourneyReturnUpdateApiResModel.status == "success") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$vehicleNumber is Returned Successfully'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      /// ✅ Call getVehicleHistory to refresh data after success
      getVehicleHistory(context);
    }
  }
}
