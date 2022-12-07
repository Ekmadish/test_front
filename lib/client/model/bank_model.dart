class BankModel {
  const BankModel({
    this.total,
    this.dataList,
  });
  final int? total;

  final List<BankModelDataList>? dataList;

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        total: json["total"],
        dataList: List<BankModelDataList>.from(
            json["dataList"].map((x) => BankModelDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "dataList": List<dynamic>.from(dataList!.map((x) => x.toJson())),
      };
}

class BankModelDataList {
  BankModelDataList({
    this.id,
    this.guid,
    this.companyGuid,
    this.name,
    this.info,
    this.isActive,
    this.qStatus,
  });

  final int? id;
  final String? guid;
  final String? companyGuid;
  final String? name;
  final String? info;
  final int? isActive;
  final int? qStatus;

  factory BankModelDataList.fromJson(Map<String, dynamic> json) =>
      BankModelDataList(
        id: json["id"],
        guid: json["guid"],
        companyGuid: json["companyGuid"],
        name: json["name"],
        info: json["info"],
        isActive: json["isActive"],
        qStatus: json["qStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guid": guid,
        "companyGuid": companyGuid,
        "name": name,
        "info": info,
        "isActive": isActive,
        "qStatus": qStatus,
      };
}
