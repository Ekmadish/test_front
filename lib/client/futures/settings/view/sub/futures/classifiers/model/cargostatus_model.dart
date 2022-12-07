class CargoStatusModel {
  const CargoStatusModel({
    this.total,
    this.dataList,
  });

  final int? total;
  final List<CargoStatusDataList>? dataList;

  factory CargoStatusModel.fromJson(Map<String, dynamic> json) =>
      CargoStatusModel(
        total: json["total"],
        dataList: List<CargoStatusDataList>.from(
            json["dataList"].map((x) => CargoStatusDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "dataList": List<dynamic>.from(dataList!.map((x) => x.toJson())),
      };
}

class CargoStatusDataList {
  const CargoStatusDataList({
    this.id,
    this.guid,
    this.companyGuid,
    this.name,
    this.isActive,
    this.isInitial,
    this.isFinal,
    this.qStatus,
  });

  final int? id;
  final String? guid;
  final String? companyGuid;
  final String? name;
  final int? isActive;
  final int? isInitial;
  final int? isFinal;
  final int? qStatus;

  factory CargoStatusDataList.fromJson(Map<String, dynamic> json) =>
      CargoStatusDataList(
        id: json["id"],
        guid: json["guid"],
        companyGuid: json["companyGuid"],
        name: json["name"],
        isActive: json["isActive"],
        isInitial: json["isInitial"],
        isFinal: json["isFinal"],
        qStatus: json["qStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guid": guid,
        "companyGuid": companyGuid,
        "name": name,
        "isActive": isActive,
        "isInitial": isInitial,
        "isFinal": isFinal,
        "qStatus": qStatus,
      };
}
