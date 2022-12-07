class EmployeeModel {
  EmployeeModel({
    this.total,
    this.dataList,
  });

  final int? total;
  final List<EmployeeDataList>? dataList;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        total: json["total"],
        dataList: List<EmployeeDataList>.from(
            json["dataList"].map((x) => EmployeeDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "dataList": List<dynamic>.from(dataList!.map((x) => x.toJson())),
      };
}

class EmployeeDataList {
  EmployeeDataList({
    this.id,
    this.guid,
    this.companyGuid,
    this.userType,
    this.signatureUrl,
    this.info,
    this.avatarUrl,
    this.phone,
    this.birthday,
    this.email,
    this.gender,
    this.password,
    this.qStatus,
    this.phoneIsVerify,
    this.emailIsVerify,
    this.name,
    this.givenName,
    this.surname,
    this.role,
    this.registerTime,
    this.updateTime,
    this.isSuper,
    this.subCompanyGuid,
    this.departmentGuid,
    this.postGuid,
    this.isUnlimitedAccess,
    this.groupGuids,
  });

  final int? id;
  final String? guid;
  final String? companyGuid;
  final int? userType;
  final String? signatureUrl;
  final String? info;
  final String? avatarUrl;
  final String? phone;
  final int? birthday;
  final String? email;
  final int? gender;
  final String? password;
  final int? qStatus;
  final int? phoneIsVerify;
  final int? emailIsVerify;
  final String? name;
  final String? givenName;
  final String? surname;
  final String? role;
  final int? registerTime;
  final int? updateTime;
  final int? isSuper;
  final String? subCompanyGuid;
  final String? departmentGuid;
  final String? postGuid;
  final int? isUnlimitedAccess;
  final String? groupGuids;

  factory EmployeeDataList.fromJson(Map<String, dynamic> json) =>
      EmployeeDataList(
        id: json["id"],
        guid: json["guid"],
        companyGuid: json["companyGuid"],
        userType: json["userType"],
        signatureUrl: json["signatureUrl"],
        info: json["info"],
        avatarUrl: json["avatarUrl"],
        phone: json["phone"],
        birthday: json["birthday"],
        email: json["email"],
        gender: json["gender"],
        password: json["password"],
        qStatus: json["qStatus"],
        phoneIsVerify: json["phoneIsVerify"],
        emailIsVerify: json["emailIsVerify"],
        name: json["name"],
        givenName: json["givenName"],
        surname: json["surname"],
        role: json["role"],
        registerTime: json["registerTime"],
        updateTime: json["updateTime"],
        isSuper: json["isSuper"],
        subCompanyGuid: json["subCompanyGuid"],
        departmentGuid: json["departmentGuid"],
        postGuid: json["postGuid"],
        isUnlimitedAccess: json["isUnlimitedAccess"],
        groupGuids: json["groupGuids"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guid": guid,
        "companyGuid": companyGuid,
        "userType": userType,
        "signatureUrl": signatureUrl,
        "info": info,
        "avatarUrl": avatarUrl,
        "phone": phone,
        "birthday": birthday,
        "email": email,
        "gender": gender,
        "password": password,
        "qStatus": qStatus,
        "phoneIsVerify": phoneIsVerify,
        "emailIsVerify": emailIsVerify,
        "name": name,
        "givenName": givenName,
        "surname": surname,
        "role": role,
        "registerTime": registerTime,
        "updateTime": updateTime,
        "isSuper": isSuper,
        "subCompanyGuid": subCompanyGuid,
        "departmentGuid": departmentGuid,
        "postGuid": postGuid,
        "isUnlimitedAccess": isUnlimitedAccess,
        "groupGuids": groupGuids,
      };
}
