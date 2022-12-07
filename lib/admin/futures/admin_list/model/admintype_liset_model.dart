import 'package:tasu/admin/futures/admin_list/model/admin_model.dart';

class AdminTypeModel {
  int? total;
  List<AdminTypeListModel>? adminTypeList;

  AdminTypeModel({this.total, this.adminTypeList});

  AdminTypeModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['adminTypeList'] != null) {
      adminTypeList = <AdminTypeListModel>[];
      json['adminTypeList'].forEach((v) {
        adminTypeList!.add(AdminTypeListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    if (adminTypeList != null) {
      data['adminTypeList'] = adminTypeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class AdminTypeList {
//   int? id;
//   String? guid;
//   String? description;
//   int? displayOrder;
//   int? isSuper;
//   int? qStatus;
//   String? typeName;

//   AdminTypeList(
//       {this.id,
//       this.guid,
//       this.description,
//       this.displayOrder,
//       this.isSuper,
//       this.qStatus,
//       this.typeName});

//   factory AdminTypeList.fromJson(Map<String, dynamic> json) {
//     return AdminTypeList(
//       id: json['id'],
//       guid: json['guid'],
//       description: json['description'],
//       displayOrder: json['displayOrder'],
//       isSuper: json['isSuper'],
//       qStatus: json['qStatus'],
//       typeName: json['typeName'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = this.id;
//     data['guid'] = this.guid;
//     data['description'] = this.description;
//     data['displayOrder'] = this.displayOrder;
//     data['isSuper'] = this.isSuper;
//     data['qStatus'] = this.qStatus;
//     data['typeName'] = this.typeName;
//     return data;
//   }
// }
