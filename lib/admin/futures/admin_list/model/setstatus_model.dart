class SetStatusModel {
  List<String>? guidList;
  String? type;

  SetStatusModel({this.guidList, this.type});

  SetStatusModel.fromJson(Map<String, dynamic> json) {
    guidList = json['guidList'].cast<String>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guidList'] = guidList;
    data['type'] = type;
    return data;
  }
}
