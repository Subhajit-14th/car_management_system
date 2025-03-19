class LoginApiResModel {
  String? msg;
  bool? success;
  LoginData? data;

  LoginApiResModel({this.msg, this.success, this.data});

  factory LoginApiResModel.fromJson(Map<String, dynamic> json) {
    return LoginApiResModel(
      msg: json['msg'],
      success: json['success'],
      // If `Data` is a map, parse it normally; if it's a list, assign `null`
      data: json['Data'] is Map<String, dynamic>
          ? LoginData.fromJson(json['Data'])
          : null,
    );
  }
}

class LoginData {
  String? phone;
  String? token;

  LoginData({this.phone, this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      phone: json['phone'],
      token: json['token'],
    );
  }
}
