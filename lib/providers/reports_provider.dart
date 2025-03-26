import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/controller/reports_controller.dart';
import 'package:municipality_car_management_system/model/ReportsModel/reportsApiResModel.dart';

class ReportsProvider extends ChangeNotifier {
  final TextEditingController _startDateController = TextEditingController();
  TextEditingController get startDateController => _startDateController;
  final TextEditingController _endDateController = TextEditingController();
  TextEditingController get endDateController => _endDateController;
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  ReportsApiResModel _reportsApiResModel = ReportsApiResModel();
  ReportsApiResModel get reportsApiResModel => _reportsApiResModel;

  final ReportsController _reportsController = ReportsController();

  List<Record> _repostList = [];
  List<Record> get repostList => _repostList;

  bool _isDataLoading = false;
  bool get isDataLoading => _isDataLoading;

  /// get report list
  void getReportsList(context) async {
    _isDataLoading = true;
    notifyListeners();
    _reportsApiResModel =
        await _reportsController.getReportsList(context: context);
    if (_reportsApiResModel.status == 200) {
      _repostList.clear();
      // ✅ Save original data for reset
      _repostList.addAll(_reportsApiResModel.record ?? []);
      // _reportsApiResModel.record?.forEach(
      //   (element) {
      //     _repostList.add(element);
      //   },
      // );
      _isDataLoading = false;
    } else {
      _isDataLoading = false;
    }
    notifyListeners();
  }

  /// select date
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      controller.text = formattedDate;
      notifyListeners();
    }
  }

  /// Filter report list based on search query
  /// Filter report list based on search query
  void filterReports(String query) {
    if (query.isEmpty) {
      _repostList.clear();
      _repostList.addAll(_reportsApiResModel.record ?? []);
    } else {
      _repostList = (_reportsApiResModel.record ?? []).where((record) {
        final vehicleNo = record.vehicleNo?.toLowerCase() ?? '';
        final driverName = record.driverName?.toLowerCase() ?? '';
        final searchQuery = query.toLowerCase();

        // Check if query matches vehicle number or driver name
        return vehicleNo.contains(searchQuery) ||
            driverName.contains(searchQuery);
      }).toList();
    }
    notifyListeners();
  }
}
