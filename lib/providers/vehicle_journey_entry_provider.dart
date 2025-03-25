import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/controller/vehicle_journey_entry_controller.dart';
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/driver_name_api_res_model.dart'
    as driver_name;
import 'package:municipality_car_management_system/model/VehicleJourneyEntryModel/vehicle_data_submit_api_res_model.dart';
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

  /// Driver name list
  List<driver_name.Record> _driverNameList = [];
  List<driver_name.Record> get driverNameList => _driverNameList;

  driver_name.Record? _selectedDriverName;
  driver_name.Record? get selectedDriverName => _selectedDriverName;

  driver_name.DriverNameApiResModel _driverNameApiResModel =
      driver_name.DriverNameApiResModel();

  final VehicleJourneyEntryController _vehicleJourneyEntryController =
      VehicleJourneyEntryController();

  VehicleDataSubmitApiResModel vehicleDataSubmitApiResModel =
      VehicleDataSubmitApiResModel();

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

  /// get driver name
  void getDriverNameList(context) async {
    _driverNameApiResModel =
        await _vehicleJourneyEntryController.getDriverName(context: context);
    _driverNameList = _driverNameApiResModel.record ?? [];
    notifyListeners();
  }

  /// set selected driver name
  void setSelectedDriverName(driver_name.Record record) {
    _selectedDriverName = record;
    notifyListeners();
  }

  /// submit button field
  void submit(context) async {
    var body = {
      'vehicle_no_id': '${selectedVehicle?.vehicleNo}',
      'driver_name_id': '${selectedDriverName?.drivername}',
      'ward_no_id': '${selectedWordNo?.wardno}',
      'workers_name_id': '${selectedWorkersName?.workersname}',
    };
    debugPrint('submit button is pressed: $body');

    vehicleDataSubmitApiResModel =
        await _vehicleJourneyEntryController.submitVehicleData(
            context: context,
            vehicleNoId: "${selectedVehicle?.id}",
            driverNameId: "${selectedDriverName?.id}",
            wardNoId: "${selectedWordNo?.id}",
            workersNameId: "${selectedWorkersName?.id}");

    if (vehicleDataSubmitApiResModel.status == "success") {
      // ✅ Clear TextEditingController values
      _vehicleNumber.clear();
      _wordNo.clear();
      _driverName.clear();
      _workersName.clear();

      // ✅ Reset selected values after successful submission
      _selectedVehicle = null;
      _selectedDriverName = null;
      _selectedWordNo = null;
      _selectedWorkersName = null;
      notifyListeners();
      // ✅ Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data submitted successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // ❌ Show error SnackBar in case of failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Failed to submit data: ${vehicleDataSubmitApiResModel.message}'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
