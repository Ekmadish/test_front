// // class AdminAddUpdateModel {
// //   String? message;
// //   String? status;
// //   AdminAddUpdateModel? data;

// //   AdminAddUpdateModel({this.message, this.status, this.data});

// //   AdminAddUpdateModel.fromJson(Map<String, dynamic> json) {
// //     message = json['message'];
// //     status = json['status'];
// //     data = json['data'] != null ? AdminAddUpdateModel.fromJson(json['data']) : null;
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['message'] = this.message;
// //     data['status'] = this.status;
// //     if (this.data != null) {
// //       data['data'] = this.data!.toJson();
// //     }
// //     return data;
// //   }
// // }

// class AdminAddUpdateModel {
//   String? name;
//   String? guid;
//   int? qStatus;
//   int? registerTime;
//   int? updateTime;
//   String? givenName;
//   String? surname;
//   int? isSuper;
//   String? email;
//   String? phone;
//   int? gender;

//   //
//   String? adminTypeGuid;
//   String? password;
//   String? autograph;
//   String? avatarUrl;
//   int? birthday;

//   AdminAddUpdateModel({
//     this.name,
//     this.guid,
//     this.qStatus,
//     this.registerTime,
//     this.updateTime,
//     this.givenName,
//     this.surname,
//     this.isSuper,
//     this.email,
//     this.phone,
//     this.gender,
//     this.adminTypeGuid,
//     this.password,
//     this.autograph,
//     this.avatarUrl,
//     this.birthday,
//   });

//   factory AdminAddUpdateModel.fromJson(Map<String, dynamic> json) {
//     return AdminAddUpdateModel(
//         name: json['name'],
//         guid: json['guid'],
//         qStatus: json['qStatus'],
//         registerTime: json['registerTime'],
//         updateTime: json['updateTime'],
//         givenName: json['givenName'],
//         surname: json['surname'],
//         isSuper: json['isSuper'],
//         email: json['email'],
//         phone: json['phone'],
//         gender: json['gender'],
//         adminTypeGuid: json['adminTypeGuid']);
//   }

//   AdminAddUpdateModel copyWith({
//     String? name,
//     String? guid,
//     int? qStatus,
//     int? registerTime,
//     int? updateTime,
//     String? givenName,
//     String? surname,
//     int? isSuper,
//     String? email,
//     String? phone,
//     int? gender,
//     String? adminTypeGuid,

//     //
//     String? password,
//     String? autograph,
//     String? avatarUrl,
//     int? birthday,
//   }) =>
//       AdminAddUpdateModel(
//         name: name ?? this.name,
//         guid: guid ?? this.guid,
//         qStatus: qStatus ?? this.qStatus,
//         registerTime: registerTime ?? this.registerTime,
//         updateTime: updateTime ?? this.updateTime,
//         givenName: givenName ?? this.givenName,
//         surname: surname ?? this.surname,
//         isSuper: isSuper ?? this.isSuper,
//         email: email ?? this.email,
//         phone: phone ?? this.phone,
//         gender: gender ?? this.gender,
//         adminTypeGuid: adminTypeGuid ?? this.adminTypeGuid,
//         password: password ?? this.password,
//         autograph: autograph ?? this.autograph,
//         avatarUrl: avatarUrl ?? this.avatarUrl,
//         birthday: birthday ?? this.birthday,
//       );

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['guid'] = guid;
//     data['qStatus'] = qStatus;
//     data['registerTime'] = registerTime;
//     data['updateTime'] = updateTime;
//     data['givenName'] = givenName;
//     data['surname'] = surname;
//     data['isSuper'] = isSuper;
//     data['email'] = email;
//     data['phone'] = phone;
//     data['gender'] = gender;
//     data['password'] = password;
//     data['birthday'] = birthday;
//     data['avatarUrl'] = avatarUrl;
//     data['adminTypeGuid'] = adminTypeGuid;
//     return data;
//   }
// }
