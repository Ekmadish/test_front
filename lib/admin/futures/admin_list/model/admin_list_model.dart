class AdminListModel {
  int? total;
  List<AdminListDataList>? dataList;

  AdminListModel({this.total, this.dataList});

  AdminListModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['dataList'] != null) {
      dataList = <AdminListDataList>[];
      json['dataList'].forEach((v) {
        dataList!.add(AdminListDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = this.total;
    if (this.dataList != null) {
      data['dataList'] = this.dataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdminListDataList {
  String? guid;
  String? name;
  String? email;
  String? phone;
  int? registerTime;
  int? updateTime;
  String? avatarUrl;
  String? autograph;
  int? birthday;
  int? gender;
  String? adminTypeGuid;
  int? isSuper;
  String? role;
  Type? type;
  bool selected = false;

  AdminListDataList(
      {this.guid,
      this.name,
      this.email,
      this.phone,
      this.registerTime,
      this.updateTime,
      this.avatarUrl,
      this.autograph,
      this.birthday,
      this.gender,
      this.adminTypeGuid,
      this.isSuper,
      this.role,
      this.type});

  AdminListDataList.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    registerTime = json['registerTime'];
    updateTime = json['updateTime'];
    avatarUrl = json['avatarUrl'];
    autograph = json['autograph'];
    birthday = json['birthday'];
    gender = json['gender'];
    adminTypeGuid = json['adminTypeGuid'];
    isSuper = json['isSuper'];
    role = json['role'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['registerTime'] = this.registerTime;
    data['updateTime'] = this.updateTime;
    data['avatarUrl'] = this.avatarUrl;
    data['autograph'] = this.autograph;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['adminTypeGuid'] = this.adminTypeGuid;
    data['isSuper'] = this.isSuper;
    data['role'] = this.role;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class Type {
  int? id;
  String? guid;
  Null? description;
  int? displayOrder;
  int? isSuper;
  int? qStatus;
  String? typeName;

  Type(
      {this.id,
      this.guid,
      this.description,
      this.displayOrder,
      this.isSuper,
      this.qStatus,
      this.typeName});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guid = json['guid'];
    description = json['description'];
    displayOrder = json['displayOrder'];
    isSuper = json['isSuper'];
    qStatus = json['qStatus'];
    typeName = json['typeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
