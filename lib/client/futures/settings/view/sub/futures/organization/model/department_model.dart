class DepartmentModel {
  const DepartmentModel({
    required this.total,
    required this.dataList,
  });

  final int total;
  final List<DepartmentDataList> dataList;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(
        total: json["total"],
        dataList: List<DepartmentDataList>.from(
            json["dataList"].map((x) => DepartmentDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "dataList": List<dynamic>.from(dataList.map((x) => x.toJson())),
      };
}

class DepartmentDataList {
  const DepartmentDataList({
    this.id,
    this.guid,
    this.companyGuid,
    this.belongGuid,
    this.name,
    this.code,
    this.qStatus,
  });

  final int? id;
  final String? guid;
  final String? companyGuid;
  final String? belongGuid;
  final String? name;
  final String? code;
  final int? qStatus;

  factory DepartmentDataList.fromJson(Map<String, dynamic> json) =>
      DepartmentDataList(
        id: json["id"],
        guid: json["guid"],
        companyGuid: json["companyGuid"],
        belongGuid: json["belongGuid"],
        name: json["name"],
        code: json["code"],
        qStatus: json["qStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guid": guid,
        "companyGuid": companyGuid,
        "belongGuid": belongGuid,
        "name": name,
        "code": code,
        "qStatus": qStatus,
      };
}
