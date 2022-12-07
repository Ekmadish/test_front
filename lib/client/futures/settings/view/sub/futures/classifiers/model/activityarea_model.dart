class ActivityAreaModel {
  const ActivityAreaModel({
    this.total,
  });
  final int? total;

  factory ActivityAreaModel.fromJson(Map<String, dynamic> json) =>
      ActivityAreaModel(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
