import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/controller/vehicle_journey_entry_controller.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/vehicle_number_api_res_model.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/word_number_api_res_model.dart'
    as word_no;
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/workers_name_api_res_model.dart'
    as workers_name;

class VehicleJourneyEntryProvider extends ChangeNotifier {
  final TextEditingController _vehicleNumber = TextEditingController();
  TextEditingController get vehicleNumber => _vehicleNumber;

  final TextEditingController _wordNo = TextEditingController();
  TextEditingController get wordNo => _wordNo;

  final TextEditingController _driverName = TextEditingController();
  TextEditingController get driverName => _driverName;

  final TextEditingController _workersName = TextEditingController();
  TextEditingController get workersName => _workersName;

  /// Vehicle List No
  List<Record> _vehicleNumberList = [];
  List<Record> get vehicleNumberList => _vehicleNumberList;

  Record? _selectedVehicle; // Store selected vehicle record
  Record? get selectedVehicle => _selectedVehicle;

  VehicleNumberApiResModel _vehicleNumberApiResModel =
      VehicleNumberApiResModel();

  /// Word No List
  List<word_no.Record> _wordNoList = [];
  List<word_no.Record> get wordNoList => _wordNoList;

  word_no.Record? _selectedWordNo;
  word_no.Record? get selectedWordNo => _selectedWordNo;

  word_no.WordNumberApiResModel _wordNumberApiResModel =
      word_no.WordNumberApiResModel();

  /// Workers Name List
  List<workers_name.Record> _workersNameList = [];
  List<workers_name.Record> get workersNameList => _workersNameList;

  workers_name.Record? _selectedWorkersName;
  workers_name.Record? get selectedWorkersName => _selectedWorkersName;

  workers_name.WorkersNameApiResModel _workersNameApiResModel =
      workers_name.WorkersNameApiResModel();

  VehicleJourneyEntryController _vehicleJourneyEntryController =
      VehicleJourneyEntryController();

  /// get vehicle number list
  void getVehicleNumberList(context) async {
    _vehicleNumberApiResModel =
        await _vehicleJourneyEntryController.vehicleNumber(context: context);
    _vehicleNumberList = _vehicleNumberApiResModel.record ?? [];
    notifyListeners();
  }

  /// Set selected vehicle details
  void setSelectedVehicle(Record record) {
    _selectedVehicle = record;
    notifyListeners();
  }

  /// get word no list
  void getWordNo(context) async {
    _wordNumberApiResModel = await _vehicleJourneyEntryController
        .getWordNumberList(context: context);
    _wordNoList = _wordNumberApiResModel.record ?? [];
    notifyListeners();
  }

  /// set selected word no
  void setSelectedWordNo(word_no.Record record) {
    _selectedWordNo = record;
    notifyListeners();
  }

  /// get workers name list
  void getWorkersNameList(context) async {
    _workersNameApiResModel =
        await _vehicleJourneyEntryController.getWorkersName(context: context);
    _workersNameList = _workersNameApiResModel.record ?? [];
    notifyListeners();
  }

  /// set selected workers name
  void setSelectedWorkersName(workers_name.Record record) {
    _selectedWorkersName = record;
    notifyListeners();
  }
}
