class LoginModel {
  String? message;
  String? status;
  LoginModelData? data;



  LoginModel({this.message, this.status, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      status: json['status'],
      data: json['data'] != null ? LoginModelData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginModelData {
  String? accessToken;
  String? refreshToken;

  LoginModelData({this.accessToken, this.refreshToken});
  factory LoginModelData.fromJson(Map<String, dynamic> json) {
    return LoginModelData(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
