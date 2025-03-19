import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:municipality_car_management_system/model/LoginModel/login_api_res_model.dart';
import 'package:municipality_car_management_system/services/dependency_services.dart';

class LoginController {
  final dio = getIt<Dio>();

  Future<LoginApiResModel> login(
      {required String phone,
      required String password,
      required BuildContext context}) async {
    LoginApiResModel loginApiResModel = LoginApiResModel();
    var data = FormData.fromMap({
      'phone': phone,
      'password': password,
    });
    try {
      final response = await dio.request(
        'user-login.php',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );
      debugPrint('My response is: ${response.data}');
      loginApiResModel = LoginApiResModel.fromJson(response.data);
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
      debugPrint('My Login Api Error is: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Dio Exception: $e"),
          backgroundColor: Colors.blueAccent,
          duration: Duration(seconds: 3),
        ),
      );
    }
    return loginApiResModel;
  }
}
