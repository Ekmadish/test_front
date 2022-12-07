// class AdminModel {
//   String? message;
//   String? status;
//   AdminModel? data;

//   AdminModel({this.message, this.status, this.data});

//  factory AdminModel.fromJson(Map<String, dynamic> json) {

//   return
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? AdminModel.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     data['status'] = status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

class AdminModel {
  final String? name;
  final String? guid;
  final int? qStatus;
  final int? registerTime;
  final int? updateTime;
  final String? givenName;
  final String? surname;
  final int? isSuper;
  final String? email;
  final String? phone;
  final int? gender;

  AdminModel(
      {this.name,
      this.guid,
      this.qStatus,
      this.registerTime,
      this.updateTime,
      this.givenName,
      this.surname,
      this.isSuper,
      this.email,
      this.phone,
      this.gender});

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      name: json['name'],
      guid: json['guid'],
      qStatus: json['qStatus'],
      registerTime: json['registerTime'],
      updateTime: json['updateTime'],
      givenName: json['givenName'],
      surname: json['surname'],
      isSuper: json['isSuper'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['guid'] = guid;
    data['qStatus'] = qStatus;
    data['registerTime'] = registerTime;
    data['updateTime'] = updateTime;
    data['givenName'] = givenName;
    data['surname'] = surname;
    data['isSuper'] = isSuper;
    data['email'] = email;
    data['phone'] = phone;
    data['gender'] = gender;
    return data;
  }
}
