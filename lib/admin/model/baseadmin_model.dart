class BaseAdminModel {
  int? totalCompanyCount;
  int? totalUserCount;
  int? totalPersonCount;
  int? dayCompanyCount;
  int? dayUserCount;
  int? dayPersonCount;

  BaseAdminModel(
      {this.totalCompanyCount,
      this.totalUserCount,
      this.totalPersonCount,
      this.dayCompanyCount,
      this.dayUserCount,
      this.dayPersonCount});

  factory BaseAdminModel.fromJson(Map<String, dynamic> json) {
    return BaseAdminModel(
      totalCompanyCount: json['totalCompanyCount'],
      totalUserCount: json['totalUserCount'],
      totalPersonCount: json['totalPersonCount'],
      dayCompanyCount: json['dayCompanyCount'],
      dayUserCount: json['dayUserCount'],
      dayPersonCount: json['dayPersonCount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCompanyCount'] = totalCompanyCount;
    data['totalUserCount'] = totalUserCount;
    data['totalPersonCount'] = totalPersonCount;
    data['dayCompanyCount'] = dayCompanyCount;
    data['dayUserCount'] = dayUserCount;
    data['dayPersonCount'] = dayPersonCount;
    return data;
  }
}
