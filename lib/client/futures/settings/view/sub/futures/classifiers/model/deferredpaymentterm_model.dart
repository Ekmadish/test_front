class DeferredpaymenttermModel {
  DeferredpaymenttermModel({
    this.total,
  });

  final int? total;

  factory DeferredpaymenttermModel.fromJson(Map<String, dynamic> json) =>
      DeferredpaymenttermModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
