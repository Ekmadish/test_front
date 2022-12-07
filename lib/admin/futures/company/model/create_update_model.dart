// class CompanyAddUpdateModel {
//   String? message;
//   String? status;
//   Data? data;

//   CompanyAddUpdateModel({this.message, this.status, this.data});

//   CompanyAddUpdateModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class CompanyAddUpdateModel {
  CurrentCompany? currentCompany = CurrentCompany();
  SuperUser? superUser = SuperUser();

  CompanyAddUpdateModel({this.currentCompany, this.superUser});

  factory CompanyAddUpdateModel.fromJson(Map<String, dynamic> json) {
    return CompanyAddUpdateModel(
      currentCompany: json['currentCompany'] != null
          ? CurrentCompany.fromJson(json['currentCompany'])
          : null,
      superUser: json['superUser'] != null
          ? SuperUser.fromJson(json['superUser'])
          : null,
    );
  }

  CompanyAddUpdateModel copyWith({CurrentCompany? c, SuperUser? s}) {
    return CompanyAddUpdateModel(
      currentCompany: c ?? this.currentCompany,
      superUser: s ?? this.superUser,
    );
  }

  // CompanyAddUpdateModel copyWith({
  //   // int? id,
  //   // String? guid,
  //   // String? companyName,
  //   // String? bin,
  //   // int? role,
  //   // int? status,
  //   // int? isVerify,
  //   // int? addTime,
  //   // int? updateTime,
  //   // int? qStatus,
  //   // String? logoUrl,
  //   // String? tin,
  //   // String? ogrn,
  //   // String? okpo,
  //   // String? trn,
  //   // String? rrc,
  //   // String? info,
  //   // String? businessLicenseUrl,
  //   // String? legalRepresentativeName,
  //   // String? legalRepresentativeId,
  //   // // int? userid,
  //   // // String? guid,
  //   // String? companyGuid,
  //   // int? userType,
  //   // String? signatureUrl,
  //   // // String? info,
  //   // String? avatarUrl,
  //   // String? phone,
  //   // int? birthday,
  //   // String? email,
  //   // int? gender,
  //   // String? password,
  //   // // int? qStatus,
  //   // int? phoneIsVerify,
  //   // int? emailIsVerify,
  //   // String? name,
  //   // String? givenName,
  //   // String? surname,
  //   // // String? role,
  //   // int? registerTime,
  //   // // int? updateTime,
  //   // int? isSuper,
  //   // String? subCompanyGuid,
  //   // String? departmentGuid,
  //   // String? postGuid,
  //   // int? isUnlimitedAccess,
  //   // String? groupGuids,
  //   CurrentCompany? c,
  //   SuperUser? s,
  // }) {
  //   return CompanyAddUpdateModel(
  //       currentCompany: c ?? currentCompany, superUser: s ?? superUser);
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currentCompany != null) {
      data['currentCompany'] = currentCompany!.toJson();
    }
    if (superUser != null) {
      data['superUser'] = superUser!.toJson();
    }
    return data;
  }
}

class CurrentCompany {
  int? id;
  String? guid;
  String? companyName;
  String? bin;
  int? role;
  int? status;
  int? isVerify;
  int? addTime;
  int? updateTime;
  int? qStatus;
  String? logoUrl;
  String? tin;
  String? ogrn;
  String? okpo;
  String? trn;
  String? rrc;
  String? info;
  String? businessLicenseUrl;
  String? legalRepresentativeName;
  String? legalRepresentativeId;

  CurrentCompany(
      {this.id,
      this.guid,
      this.companyName,
      this.bin,
      this.role,
      this.status,
      this.isVerify,
      this.addTime,
      this.updateTime,
      this.qStatus,
      this.logoUrl,
      this.tin,
      this.ogrn,
      this.okpo,
      this.trn,
      this.rrc,
      this.info,
      this.businessLicenseUrl,
      this.legalRepresentativeName,
      this.legalRepresentativeId});

  CurrentCompany copyWith({
    int? id,
    String? guid,
    String? companyName,
    String? bin,
    int? role,
    int? status,
    int? isVerify,
    int? addTime,
    int? updateTime,
    int? qStatus,
    String? logoUrl,
    String? tin,
    String? ogrn,
    String? okpo,
    String? trn,
    String? rrc,
    String? info,
    String? businessLicenseUrl,
    String? legalRepresentativeName,
    String? legalRepresentativeId,
  }) =>
      CurrentCompany(
        id: id ?? this.id,
        guid: guid ?? this.guid,
        companyName: companyName ?? this.companyName,
        bin: bin ?? this.bin,
        role: role ?? this.role,
        status: status ?? this.status,
        isVerify: isVerify ?? this.isVerify,
        addTime: addTime ?? this.addTime,
        updateTime: updateTime ?? this.updateTime,
        qStatus: qStatus ?? this.qStatus,
        logoUrl: logoUrl ?? this.logoUrl,
        tin: tin ?? this.tin,
        ogrn: ogrn ?? this.ogrn,
        okpo: okpo ?? this.okpo,
        trn: trn ?? this.trn,
        rrc: rrc ?? this.rrc,
        info: info ?? this.info,
        businessLicenseUrl: businessLicenseUrl ?? this.businessLicenseUrl,
        legalRepresentativeName:
            legalRepresentativeName ?? this.legalRepresentativeName,
        legalRepresentativeId:
            legalRepresentativeId ?? this.legalRepresentativeId,
      );

  factory CurrentCompany.fromJson(Map<String, dynamic> json) {
    return CurrentCompany(
      id: json['id'],
      guid: json['guid'],
      companyName: json['companyName'],
      bin: json['bin'],
      role: json['role'],
      status: json['status'],
      isVerify: json['isVerify'],
      addTime: json['addTime'],
      updateTime: json['updateTime'],
      qStatus: json['qStatus'],
      logoUrl: json['logoUrl'],
      tin: json['tin'],
      ogrn: json['ogrn'],
      okpo: json['okpo'],
      trn: json['trn'],
      rrc: json['rrc'],
      info: json['info'],
      businessLicenseUrl: json['businessLicenseUrl'],
      legalRepresentativeName: json['legalRepresentativeName'],
      legalRepresentativeId: json['legalRepresentativeId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['guid'] = this.guid;
    data['companyName'] = this.companyName;
    data['bin'] = this.bin;
    data['role'] = this.role;
    data['status'] = this.status;
    data['isVerify'] = this.isVerify;
    data['addTime'] = this.addTime;
    data['updateTime'] = this.updateTime;
    data['qStatus'] = this.qStatus;
    data['logoUrl'] = this.logoUrl;
    data['tin'] = this.tin;
    data['ogrn'] = this.ogrn;
    data['okpo'] = this.okpo;
    data['trn'] = this.trn;
    data['rrc'] = this.rrc;
    data['info'] = this.info;
    data['businessLicenseUrl'] = this.businessLicenseUrl;
    data['legalRepresentativeName'] = this.legalRepresentativeName;
    data['legalRepresentativeId'] = this.legalRepresentativeId;
    return data;
  }
}

class SuperUser {
  int? id;
  String? guid;
  String? companyGuid;
  int? userType;
  String? signatureUrl;
  String? info;
  String? avatarUrl;
  String? phone;
  int? birthday;
  String? email;
  int? gender;
  String? password;
  int? qStatus;
  int? phoneIsVerify;
  int? emailIsVerify;
  String? name;
  String? givenName;
  String? surname;
  String? role;
  int? registerTime;
  int? updateTime;
  int? isSuper;
  String? subCompanyGuid;
  String? departmentGuid;
  String? postGuid;
  int? isUnlimitedAccess;
  String? groupGuids;

  SuperUser(
      {this.id,
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
      this.groupGuids});

  SuperUser copyWith({
    int? id,
    String? guid,
    String? companyGuid,
    int? userType,
    String? signatureUrl,
    String? info,
    String? avatarUrl,
    String? phone,
    int? birthday,
    String? email,
    int? gender,
    String? password,
    int? qStatus,
    int? phoneIsVerify,
    int? emailIsVerify,
    String? name,
    String? givenName,
    String? surname,
    String? role,
    int? registerTime,
    int? updateTime,
    int? isSuper,
    String? subCompanyGuid,
    String? departmentGuid,
    String? postGuid,
    int? isUnlimitedAccess,
    String? groupGuids,
  }) =>
      SuperUser(
        id: id ?? this.id,
        guid: guid ?? this.guid,
        companyGuid: companyGuid ?? this.companyGuid,
        userType: userType ?? this.userType,
        signatureUrl: signatureUrl ?? this.signatureUrl,
        info: info ?? this.info,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        phone: phone ?? this.phone,
        birthday: birthday ?? this.birthday,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        password: password ?? this.password,
        qStatus: qStatus ?? this.qStatus,
        phoneIsVerify: phoneIsVerify ?? this.phoneIsVerify,
        emailIsVerify: emailIsVerify ?? this.emailIsVerify,
        name: name ?? this.name,
        givenName: givenName ?? this.givenName,
        surname: surname ?? this.surname,
        role: role ?? this.role,
        registerTime: registerTime ?? this.registerTime,
        updateTime: updateTime ?? this.updateTime,
        isSuper: isSuper ?? this.isSuper,
        subCompanyGuid: subCompanyGuid ?? this.subCompanyGuid,
        departmentGuid: departmentGuid ?? this.departmentGuid,
        postGuid: postGuid ?? this.postGuid,
        isUnlimitedAccess: isUnlimitedAccess ?? this.isUnlimitedAccess,
        groupGuids: groupGuids ?? this.groupGuids,
      );

  factory SuperUser.fromJson(Map<String, dynamic> json) {
    return SuperUser(
      id: json['id'],
      guid: json['guid'],
      companyGuid: json['companyGuid'],
      userType: json['userType'],
      signatureUrl: json['signatureUrl'],
      info: json['info'],
      avatarUrl: json['avatarUrl'],
      phone: json['phone'],
      birthday: json['birthday'],
      email: json['email'],
      gender: json['gender'],
      password: json['password'],
      qStatus: json['qStatus'],
      phoneIsVerify: json['phoneIsVerify'],
      emailIsVerify: json['emailIsVerify'],
      name: json['name'],
      givenName: json['givenName'],
      surname: json['surname'],
      role: json['role'],
      registerTime: json['registerTime'],
      updateTime: json['updateTime'],
      isSuper: json['isSuper'],
      subCompanyGuid: json['subCompanyGuid'],
      departmentGuid: json['departmentGuid'],
      postGuid: json['postGuid'],
      isUnlimitedAccess: json['isUnlimitedAccess'],
      groupGuids: json['groupGuids'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['guid'] = this.guid;
    data['companyGuid'] = this.companyGuid;
    data['userType'] = this.userType;
    data['signatureUrl'] = this.signatureUrl;
    data['info'] = this.info;
    data['avatarUrl'] = this.avatarUrl;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['password'] = this.password;
    data['qStatus'] = this.qStatus;
    data['phoneIsVerify'] = this.phoneIsVerify;
    data['emailIsVerify'] = this.emailIsVerify;
    data['name'] = this.name;
    data['givenName'] = this.givenName;
    data['surname'] = this.surname;
    data['role'] = this.role;
    data['registerTime'] = this.registerTime;
    data['updateTime'] = this.updateTime;
    data['isSuper'] = this.isSuper;
    data['subCompanyGuid'] = this.subCompanyGuid;
    data['departmentGuid'] = this.departmentGuid;
    data['postGuid'] = this.postGuid;
    data['isUnlimitedAccess'] = this.isUnlimitedAccess;
    data['groupGuids'] = this.groupGuids;
    return data;
  }
}
