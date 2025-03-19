import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/controller/login_controller.dart';
import 'package:municipality_car_management_system/model/LoginModel/login_api_res_model.dart';
import 'package:municipality_car_management_system/services/hive_services.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';

class AuthProviders extends ChangeNotifier {
  final TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController get phoneNumberController => _phoneNumberController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  LoginApiResModel _loginApiResModel = LoginApiResModel();
  LoginApiResModel get loginApiResModel => _loginApiResModel;

  final LoginController _loginController = LoginController();

  AuthProviders() {
    _checkAuthentication();
  }

  /// Check if user is authenticated by checking stored access token
  Future<void> _checkAuthentication() async {
    debugPrint('Check the auth token');
    String? token = HiveDatabase.getAccessToken(); // Fetch token from Hive
    if (token.isNotEmpty) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  /// Login Function
  void login(BuildContext context) async {
    _isLoading = true;
    _loginApiResModel = await _loginController.login(
      phone: _phoneNumberController.text,
      password: _passwordController.text,
      context: context,
    );
    if (_loginApiResModel.success == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${_loginApiResModel.msg}"),
          backgroundColor: AppColor.primaryColor,
          duration: Duration(seconds: 3),
        ),
      );
      HiveDatabase.saveAccessToken(
          accessToken: '${_loginApiResModel.data?.token}');
      _checkAuthentication();
      _isLoading = false;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${_loginApiResModel.msg}"),
          backgroundColor: AppColor.primaryColor,
          duration: Duration(seconds: 3),
        ),
      );
      _isLoading = false;
    }
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
