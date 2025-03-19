import 'package:flutter/material.dart';

class ScreenRouteProvider extends ChangeNotifier {
  final List<String> _screenRoutes = [
    "Vichcle Journey Entry",
    "Vichcle Journey History",
    "Reports",
    "Logout"
  ];
  List<String> get screenRoutes => _screenRoutes;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
