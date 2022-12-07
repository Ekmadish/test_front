class TransUserListModel {
  const TransUserListModel({
    this.total,
    this.userList,
  });

  final int? total;
  final List<UserList>? userList;

  factory TransUserListModel.fromJson(Map<String, dynamic> json) =>
      TransUserListModel(
        total: json["total"],
        userList: List<UserList>.from(
            json["dataList"].map((x) => UserList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "dataList": List<dynamic>.from(userList!.map((x) => x.toJson())),
      };
}

class UserList {
  UserList({
    this.guid,
    this.name,
    this.surname,
    this.givenName,
    this.registerTime,
    this.phone,
    this.email,
    this.updateTime,
    this.companyName,
    this.avatarUrl,
    this.birthday,
    this.info,
    this.signatureUrl,
    this.userType,
    this.role,
    this.isSuper,
    this.isUnlimitedAccess,
    this.subCompanyGuid,
    this.companyGuid,
    this.gender,
  });

  final String? guid;
  final String? name;
  final String? surname;
  final String? givenName;
  final int? registerTime;
  final String? phone;
  final String? email;
  final int? updateTime;
  final String? companyName;
  final String? avatarUrl;
  final int? birthday;
  final String? info;
  final String? signatureUrl;
  final int? userType;
  final String? role;
  final int? isSuper;
  final int? isUnlimitedAccess;
  final String? subCompanyGuid;
  final String? companyGuid;
  final int? gender;
  bool selected = false;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        guid: json["guid"],
        name: json["name"],
        surname: json["surname"],
        givenName: json["givenName"],
        registerTime: json["registerTime"],
        phone: json["phone"],
        email: json["email"],
        updateTime: json["updateTime"],
        companyName: json["companyName"],
        avatarUrl: json["avatarUrl"],
        birthday: json["birthday"],
        info: json["info"],
        signatureUrl:
            json["signatureUrl"] == null ? null : json["signatureUrl"]!,
        userType: json["userType"],
        role: json["role"]!,
        isSuper: json["isSuper"],
        isUnlimitedAccess: json["isUnlimitedAccess"],
        subCompanyGuid: json["subCompanyGuid"]!,
        companyGuid: json["companyGuid"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "name": name,
        "surname": surname,
        "givenName": givenName,
        "registerTime": registerTime,
        "phone": phone,
        "email": email,
        "updateTime": updateTime,
        "companyName": companyName,
        "avatarUrl": avatarUrl,
        "birthday": birthday,
        "info": info == null,
        "signatureUrl": signatureUrl == null,
        "userType": userType,
        "role": role,
        "isSuper": isSuper,
        "isUnlimitedAccess": isUnlimitedAccess,
        "subCompanyGuid": subCompanyGuid,
        "companyGuid": companyGuid,
        "gender": gender,
      };
}
