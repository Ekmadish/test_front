class CreateCompanyModel {
  final String? message;
  final String? status;
  final String? data;

  CreateCompanyModel({this.message, this.status, this.data});

  factory CreateCompanyModel.fromJson(Map<String, dynamic> json) {
    return CreateCompanyModel(
      message: json['message'],
      status: json['status'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['data'] = this.data;
    return data;
  }
}
