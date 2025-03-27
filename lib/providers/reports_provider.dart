import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/controller/reports_controller.dart';
import 'package:municipality_car_management_system/model/ReportsModel/reportDetailsApiResModel.dart'
    as reportDetails;
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

  reportDetails.ReportDetailsApiResModel _reportDetailsApiResModel =
      reportDetails.ReportDetailsApiResModel();
  reportDetails.ReportDetailsApiResModel get reportDetailsApiResModel =>
      _reportDetailsApiResModel;

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
      filterReports(_searchController.text);
    }
  }

  /// Filter report list based on search query
  void filterReports(String query) {
    DateTime? startDate;
    DateTime? endDate;

    // Parse start and end dates if available
    if (_startDateController.text.isNotEmpty) {
      startDate = _parseDate(_startDateController.text);
    }

    if (_endDateController.text.isNotEmpty) {
      endDate = _parseDate(_endDateController.text);
    }

    if (query.isEmpty && startDate == null && endDate == null) {
      _repostList.clear();
      _repostList.addAll(_reportsApiResModel.record ?? []);
    } else {
      _repostList = (_reportsApiResModel.record ?? []).where((record) {
        final vehicleNo = record.vehicleNo?.toLowerCase() ?? '';
        final driverName = record.driverName?.toLowerCase() ?? '';
        final searchQuery = query.toLowerCase();
        final dateString =
            record.date ?? ''; // Assuming date is in dd/MM/yyyy format
        final recordDate = _parseDate(dateString);

        // ✅ Apply search query filter
        final matchesQuery =
            vehicleNo.contains(searchQuery) || driverName.contains(searchQuery);

        // ✅ Apply date range filter
        final isInDateRange = (startDate == null ||
                recordDate
                    .isAfter(startDate.subtract(const Duration(days: 1)))) &&
            (endDate == null ||
                recordDate.isBefore(endDate.add(const Duration(days: 1))));

        if (query.isEmpty && (startDate != null || endDate != null)) {
          return isInDateRange; // Date-only filter
        } else if (query.isNotEmpty && startDate == null && endDate == null) {
          return matchesQuery; // Query-only filter
        } else {
          return matchesQuery && isInDateRange; // Both filters apply
        }
      }).toList();
    }
    notifyListeners();
  }

  /// get report details
  void getReportDetails(context, vehicleNo) async {
    _isDataLoading = true;
    notifyListeners();
    _reportDetailsApiResModel = await _reportsController.getReportDetails(
        context: context, vehicleNo: vehicleNo);
    if (_reportDetailsApiResModel.status == 200) {
      _isDataLoading = false;
    } else {
      _isDataLoading = false;
    }
    notifyListeners();
  }

  /// Helper function to parse date from string
  DateTime _parseDate(String dateString) {
    final parts = dateString.split('/');
    if (parts.length == 3) {
      return DateTime(
        int.parse(parts[2]), // year
        int.parse(parts[1]), // month
        int.parse(parts[0]), // day
      );
    }
    return DateTime.now(); // Return current date if parsing fails
  }
}
