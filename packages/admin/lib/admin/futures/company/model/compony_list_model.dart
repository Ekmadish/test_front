// class ConpanyLilstModel {
//   String? message;
//   String? status;
//   Data? data;
//   ConpanyLilstModel({this.message, this.status, this.data});
//   ConpanyLilstModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ?   Data.fromJson(json['data']) : null;
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =   Map<String, dynamic>();
//     data['message'] = this.message;
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

class CompanyListModel {
  int? total;
  List<CompanyListModelDataList>? dataList;

  CompanyListModel({this.total, this.dataList});

  CompanyListModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['dataList'] != null) {
      dataList = <CompanyListModelDataList>[];
      json['dataList'].forEach((v) {
        dataList!.add(CompanyListModelDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    if (dataList != null) {
      data['dataList'] = dataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyListModelDataList {
  final int? id;
  final String? guid;
  final String? companyName;
  //
  // final String? userGuid;
  // final String? email;
  // final String? phone;
  // final String? userName;
  // final String? givenName;
  // final String? surname;
  // final String? password;
  // final String? confirmPassword;
  //
  final String? bin;
  final int? role;
  final int? status;
  final int? isVerify;
  final int? addTime;
  final int? updateTime;
  final int? qStatus;
  final String? logoUrl;
  final String? tin;
  final String? ogrn;
  final String? okpo;
  final String? trn;
  final String? rrc;
  final String? info;
  final String? businessLicenseUrl;
  final String? legalRepresentativeName;
  final String? legalRepresentativeId;

  CompanyListModelDataList(
      {this.id,
      this.guid,
      // this.userGuid,
      // this.phone,
      this.companyName,
      // this.userName,
      // this.surname,
      // this.email,
      // this.givenName,
      // this.password,
      // this.confirmPassword,
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

  CompanyListModelDataList copyWith({
    int? id,
    String? guid,
    //
    String? userGuid,
    String? companyName,
    String? email,
    String? phone,
    String? userName,
    String? givenName,
    String? surname,
    String? password,
    String? confirmPassword,

    //
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
  }) {
    return CompanyListModelDataList(
        id: id ?? this.id,
        guid: guid ?? this.guid,
        companyName: companyName ?? this.companyName,
        //
        // userGuid: userGuid ?? this.userGuid,
        // email: email ?? this.email,
        // phone: phone ?? this.phone,
        // userName: userName ?? this.userName,
        // givenName: givenName ?? this.givenName,
        // surname: givenName ?? this.surname,
        // password: password ?? this.password,
        //
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
            legalRepresentativeId ?? this.legalRepresentativeId);
  }

  factory CompanyListModelDataList.fromJson(Map<String, dynamic> json) {
    return CompanyListModelDataList(
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
    data['id'] = id;
    data['guid'] = guid;
    data['companyName'] = companyName;
    data['bin'] = bin;
    data['role'] = role;
    data['status'] = status;
    data['isVerify'] = isVerify;
    data['addTime'] = addTime;
    data['updateTime'] = updateTime;
    data['qStatus'] = qStatus;
    data['logoUrl'] = logoUrl;
    data['tin'] = tin;
    data['ogrn'] = ogrn;
    data['okpo'] = okpo;
    data['trn'] = trn;
    data['rrc'] = rrc;
    data['info'] = info;
    data['businessLicenseUrl'] = businessLicenseUrl;
    data['legalRepresentativeName'] = legalRepresentativeName;
    data['legalRepresentativeId'] = legalRepresentativeId;
    return data;
  }
}
