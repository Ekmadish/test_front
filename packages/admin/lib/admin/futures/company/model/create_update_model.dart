// {
//   "companyGuid": "string",
//   "userGuid": "string",
//   "companyName": "string",
//   "bin": "string",
//   "email": "string",
//   "phone": "string",
//   "userName": "string",
//   "givenName": "string",
//   "surname": "string",
//   "password": "string",
//   "confirmPassword": "string",
//   "businessLicenseUrl": "string",
//   "legalRepresentativeName": "string",
//   "legalRepresentativeId": "string",
//   "info": "string",
//   "logoUrl": "string",
//   "tin": "string",
//   "ogrn": "string",
//   "okpo": "string",
//   "trn": "string",
//   "rrc": "string"
// }

class CompanyAddUpdateModel {
  final String? companyGuid;
  final String? userGuid;
  final String? companyName;
  final String? bin;
  final String? email;
  final String? phone;
  final String? userName;
  final String? givenName;
  final String? surname;
  final String? password;
  final String? confirmPassword;
  final String? businessLicenseUrl;
  final String? legalRepresentativeName;
  final String? legalRepresentativeId;
  final String? info;
  final String? logoUrl;
  final String? tin;
  final String? ogrn;
  final String? okpo;
  final String? trn;
  final String? rrc;

  CompanyAddUpdateModel(
      {this.companyGuid,
      this.userGuid,
      this.companyName,
      this.bin,
      this.email,
      this.phone,
      this.userName,
      this.givenName,
      this.surname,
      this.password,
      this.confirmPassword,
      this.businessLicenseUrl,
      this.legalRepresentativeName,
      this.legalRepresentativeId,
      this.info,
      this.logoUrl,
      this.tin,
      this.ogrn,
      this.okpo,
      this.trn,
      this.rrc});

  CompanyAddUpdateModel copyWith({
    String? companyGuid,
    String? userGuid,
    String? companyName,
    String? bin,
    String? email,
    String? phone,
    String? userName,
    String? givenName,
    String? surname,
    String? password,
    String? confirmPassword,
    String? businessLicenseUrl,
    String? legalRepresentativeName,
    String? legalRepresentativeId,
    String? info,
    String? logoUrl,
    String? tin,
    String? ogrn,
    String? okpo,
    String? trn,
    String? rrc,
  }) {
    return CompanyAddUpdateModel(
      companyGuid: companyGuid ?? this.companyGuid,
      userGuid: userGuid ?? this.userGuid,
      companyName: companyName ?? this.companyName,
      bin: bin ?? this.bin,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userName: userName ?? this.userName,
      givenName: givenName ?? this.givenName,
      surname: surname ?? this.surname,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      businessLicenseUrl: businessLicenseUrl ?? this.businessLicenseUrl,
      legalRepresentativeName:
          legalRepresentativeName ?? this.legalRepresentativeName,
      legalRepresentativeId:
          legalRepresentativeId ?? this.legalRepresentativeId,
      info: info ?? this.info,
      logoUrl: logoUrl ?? this.logoUrl,
      tin: tin ?? this.tin,
      ogrn: ogrn ?? this.ogrn,
      okpo: okpo ?? this.okpo,
      trn: trn ?? this.trn,
      rrc: rrc ?? this.rrc,
    );
  }

  factory CompanyAddUpdateModel.fromJson(Map<String, dynamic> json) {
    return CompanyAddUpdateModel(
      companyGuid: json['companyGuid'],
      userGuid: json['userGuid'],
      companyName: json['companyName'],
      bin: json['bin'],
      email: json['email'],
      phone: json['phone'],
      userName: json['userName'],
      givenName: json['givenName'],
      surname: json['surname'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      businessLicenseUrl: json['businessLicenseUrl'],
      legalRepresentativeName: json['legalRepresentativeName'],
      legalRepresentativeId: json['legalRepresentativeId'],
      info: json['info'],
      logoUrl: json['logoUrl'],
      tin: json['tin'],
      ogrn: json['ogrn'],
      okpo: json['okpo'],
      trn: json['trn'],
      rrc: json['rrc'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['companyGuid'] = companyGuid;
    data['userGuid'] = userGuid;
    data['companyName'] = companyName;
    data['bin'] = bin;
    data['email'] = email;
    data['phone'] = phone;
    data['userName'] = userName;
    data['givenName'] = givenName;
    data['surname'] = surname;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['businessLicenseUrl'] = businessLicenseUrl;
    data['legalRepresentativeName'] = legalRepresentativeName;
    data['legalRepresentativeId'] = legalRepresentativeId;
    data['info'] = info;
    data['logoUrl'] = logoUrl;
    data['tin'] = tin;
    data['ogrn'] = ogrn;
    data['okpo'] = okpo;
    data['trn'] = trn;
    data['rrc'] = rrc;
    return data;
  }
}
