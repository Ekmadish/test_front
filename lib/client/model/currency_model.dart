class CurrencyModel {
  const CurrencyModel({
    this.total,
    this.dataList,
  });

  final int? total;

  final List<CurrencyDataList>? dataList;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        total: json["total"],
        dataList: List<CurrencyDataList>.from(
            json["dataList"].map((x) => CurrencyDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "dataList": List<dynamic>.from(dataList!.map((x) => x.toJson())),
      };
}

class CurrencyDataList {
  const CurrencyDataList({
    this.id,
    this.name,
    this.currencyName,
    this.status,
    this.rate,
    this.qStatus,
  });
  final int? id;
  final String? name;
  final String? currencyName;
  final int? status;
  final int? rate;
  final int? qStatus;

  factory CurrencyDataList.fromJson(Map<String, dynamic> json) =>
      CurrencyDataList(
        id: json["id"],
        name: json["name"],
        currencyName: json["currencyName"],
        status: json["status"],
        rate: json["rate"],
        qStatus: json["qStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currencyName": currencyName,
        "status": status,
        "rate": rate,
        "qStatus": qStatus,
      };
}
