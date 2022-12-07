class SubCompanyModel {
  SubCompanyModel({
    this.total,
    this.dataList,
  });

  final int? total;
  final List<SubCompanyModelDataList>? dataList;

  factory SubCompanyModel.fromJson(Map<String, dynamic> json) =>
      SubCompanyModel(
        total: json["total"],
        dataList: List<SubCompanyModelDataList>.from(
            json["dataList"].map((x) => SubCompanyModelDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "dataList": List<dynamic>.from(dataList!.map((x) => x.toJson())),
      };
}

class SubCompanyModelDataList {
  SubCompanyModelDataList({
    this.id,
    this.guid,
    this.companyGuid,
    this.name,
    this.code,
    this.codeTypeId,
    this.role,
    this.status,
    this.isMainCompany,
    this.qStatus,
    this.addTime,
    this.updateTime,
    this.logoUrl,
    this.ogrn,
    this.rrc,
    this.info,
    this.directorName,
    this.nameOfWhom,
    this.nameOriginal,
    this.vatRateGuid,
    this.postGuid,
    this.pricingType,
    this.correspondentAccount,
    this.print,
    this.signature,
  });

  final int? id;
  final String? guid;
  final String? companyGuid;
  final String? name;
  final String? code;
  final int? codeTypeId;
  final String? role;
  final int? status;
  final int? isMainCompany;
  final int? qStatus;
  final int? addTime;
  final int? updateTime;
  final String? logoUrl;
  final String? ogrn;
  final String? rrc;
  final String? info;
  final String? directorName;
  final String? nameOfWhom;
  final String? nameOriginal;
  final String? vatRateGuid;
  final String? postGuid;
  final String? pricingType;
  final String? correspondentAccount;
  final String? print;
  final String? signature;

  factory SubCompanyModelDataList.fromJson(Map<String, dynamic> json) =>
      SubCompanyModelDataList(
        id: json["id"],
        guid: json["guid"],
        companyGuid: json["companyGuid"],
        name: json["name"],
        code: json["code"],
        codeTypeId: json["codeTypeId"],
        role: json["role"],
        status: json["status"],
        isMainCompany: json["isMainCompany"],
        qStatus: json["qStatus"],
        addTime: json["addTime"],
        updateTime: json["updateTime"],
        logoUrl: json["logoUrl"],
        ogrn: json["ogrn"],
        rrc: json["rrc"],
        info: json["info"],
        directorName: json["directorName"],
        nameOfWhom: json["nameOfWhom"],
        nameOriginal: json["nameOriginal"],
        vatRateGuid: json["vatRateGuid"],
        postGuid: json["postGuid"],
        pricingType: json["pricingType"],
        correspondentAccount: json["correspondentAccount"],
        print: json["print"],
        signature: json["signature"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guid": guid,
        "companyGuid": companyGuid,
        "name": name,
        "code": code,
        "codeTypeId": codeTypeId,
        "role": role,
        "status": status,
        "isMainCompany": isMainCompany,
        "qStatus": qStatus,
        "addTime": addTime,
        "updateTime": updateTime,
        "logoUrl": logoUrl,
        "ogrn": ogrn,
        "rrc": rrc,
        "info": info,
        "directorName": directorName,
        "nameOfWhom": nameOfWhom,
        "nameOriginal": nameOriginal,
        "vatRateGuid": vatRateGuid,
        "postGuid": postGuid,
        "pricingType": pricingType,
        "correspondentAccount": correspondentAccount,
        "print": print,
        "signature": signature,
      };
}
