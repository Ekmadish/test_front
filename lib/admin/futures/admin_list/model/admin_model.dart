class AdminModel implements Copyable<AdminModel> {
  int? id;
  String? guid;
  String? adminTypeGuid;
  String? name;
  String? givenName;
  String? surname;
  String? role;
  String? phone;
  String? email;
  String? password;
  int? isSuper;
  String? autograph;
  String? avatarUrl;
  int? birthday;
  int? gender;
  int? qStatus;
  int? registerTime;
  int? updateTime;
  //*/ ///////////

  AdminTypeListModel? adminTypeListModel;

  AdminModel({
    this.id,
    this.guid,
    this.adminTypeGuid,
    this.name,
    this.givenName,
    this.surname,
    this.role,
    this.phone,
    this.email,
    this.password,
    this.isSuper,
    this.autograph,
    this.avatarUrl,
    this.birthday,
    this.gender,
    this.qStatus,
    this.registerTime,
    this.updateTime,
    this.adminTypeListModel,
  });
  @override
  AdminModel copy() {
    return AdminModel();
  }

  @override
  AdminModel copyWith(
          {String? guid,
          String? adminTypeGuid,
          String? name,
          String? givenName,
          String? surname,
          String? phone,
          String? email,
          String? password,
          String? autograph,
          String? avatarUrl,
          int? birthday,
          int? gender}) =>
      AdminModel(
          guid: guid ?? this.guid,
          adminTypeGuid: adminTypeGuid ?? adminTypeGuid,
          name: name ?? this.name,
          givenName: givenName ?? this.givenName,
          surname: surname ?? this.surname,
          phone: phone ?? this.phone,
          email: email ?? this.email,
          password: password ?? this.password,
          avatarUrl: avatarUrl ?? this.avatarUrl,
          birthday: birthday ?? this.birthday,
          gender: gender ?? this.gender,
          
          );

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['id'],
      guid: json['guid'],
      adminTypeGuid: json['adminTypeGuid'],
      name: json['name'],
      givenName: json['givenName'],
      surname: json['surname'],
      role: json['role'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      isSuper: json['isSuper'],
      autograph: json['autograph'],
      avatarUrl: json['avatarUrl'],
      birthday: json['birthday'],
      gender: json['gender'],
      qStatus: json['qStatus'],
      registerTime: json['registerTime'],
      updateTime: json['updateTime'],
      adminTypeListModel: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['guid'] = guid;
    data['adminTypeGuid'] = adminTypeGuid;
    data['name'] = name;
    data['givenName'] = givenName;
    data['surname'] = surname;
    data['role'] = role;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['isSuper'] = isSuper;
    data['autograph'] = autograph;
    data['avatarUrl'] = avatarUrl;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['qStatus'] = qStatus;
    data['registerTime'] = registerTime;
    data['updateTime'] = updateTime;
    data['type'] = adminTypeListModel;
    return data;
  }
}

class AdminTypeListModel {
  int? id;
  String? guid;
  String? description;
  int? displayOrder;
  int? isSuper;
  int? qStatus;
  String? typeName;

  AdminTypeListModel(
      {this.id,
      this.guid,
      this.description,
      this.displayOrder,
      this.isSuper,
      this.qStatus,
      this.typeName});

  factory AdminTypeListModel.fromJson(Map<String, dynamic> json) {
    return AdminTypeListModel(
      id: json['id'],
      guid: json['guid'],
      description: json['description'],
      displayOrder: json['displayOrder'],
      isSuper: json['isSuper'],
      qStatus: json['qStatus'],
      typeName: json['typeName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['guid'] = this.guid;
    data['description'] = this.description;
    data['displayOrder'] = this.displayOrder;
    data['isSuper'] = this.isSuper;
    data['qStatus'] = this.qStatus;
    data['typeName'] = this.typeName;
    return data;
  }
}

abstract class Copyable<T> {
  T copy();
  T copyWith();
}
