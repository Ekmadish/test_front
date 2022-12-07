import 'dart:developer';

import 'package:tasu/admin/futures/admin_list/model/admin_list_model.dart';
import 'package:tasu/admin/futures/admin_list/model/admin_model.dart';
import 'package:tasu/admin/futures/admin_list/model/admintype_liset_model.dart';
import 'package:tasu/admin/futures/admin_list/model/setstatus_model.dart';
import 'package:tasu/admin/futures/company/model/create_update_model.dart';
import 'package:tasu/admin/util/http_util_a.dart';
import 'package:tasu/global/data/services/repository.dart';
import 'package:tasu/global/model/login_model.dart';
import 'package:tasu/admin/futures/company/model/compony_list_model.dart';
import 'package:tasu/admin/futures/user_list/model/trans_user_model.dart';
import 'package:tasu/admin/model/baseadmin_model.dart';
import 'package:tasu/global/data/db.dart';
import 'package:tasu/main.dart';

class AdminRepository extends Repository {
  AdminRepository._() {
    storage.read('a_at').then((value) {
      _accessToken = value;
    });
  }
  static final AdminRepository _adminRepository = AdminRepository._();
  factory AdminRepository() => _adminRepository;
  // final SecureStorage storage = SecureStorage();
  // final HttpController _httpController = HttpController();

  String? _accessToken;
  final HttpUtilA _httpUtil = HttpUtilA();
  @override
  Future<LoginModel> login(
      {required String loginName, required String password}) {
    try {
      return _httpUtil
          .postreq(
        '/api/Login/Admin',
        data: {"loginName": "qametaitan@gmail.com", "password": "12345678"},
        headers: _headers(),
      )
          .then((res) {
        if (res['status'] == 'success') {
          late LoginModel loginModel;
          loginModel = LoginModel.fromJson(res);
          saveToken(
              loginModel.data!.accessToken!, loginModel.data!.refreshToken!);
          return loginModel;
        } else {
          throw res['message'];
        }
      });
      // return _httpController.post('/api/Login/Admin',
      //     headers: _headers(),
      //     body: {
      //       "loginName": "qametaitan@gmail.com",
      //       "password": "12345678"
      //     }).then((res) {
      //   if (res['status'] == 'success') {
      //     late LoginModel loginModel;
      //     loginModel = LoginModel.fromJson(res);
      //     saveToken(
      //         loginModel.data!.accessToken!, loginModel.data!.refreshToken!);
      //     return loginModel;
      // } else {
      //   throw res['message'];
      // }
      // });
    } catch (e) {
      rethrow;
    }
  }

  void saveToken(String aat, String art) async {
    _accessToken = aat;
    await storage.write('a_at', aat);
    await storage.write('a_rt', art);
    await storage.write('isAdmin', '1');
  }

  Future<AdminModel> currentAdmin() {
    try {
      return _httpUtil
          .getreq(
        '/api/Admin/CurrentAdmin',
        headers: _headers(),
      )
          .then((res) {
        if (res['status'] == 'success') {
          return AdminModel.fromJson(res['data']);
          // there is object
        } else {
          throw res['message'];
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<AdminTypeModel> adminstratorTypeList() {
    try {
      return _httpUtil
          .getreq(
        '/api/Admin/AdminstratorTypeList',
        headers: _headers(),
      )
          .then((res) {
        if (res['status'] == 'success') {
          return AdminTypeModel.fromJson(res['data']);
        } else {
          throw res['message'];
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<CompanyListModel> transCompanyList(
      {required int? start, required int length, String? keyWord = ''}) {
    try {
      return _httpUtil
          .postreq('/api/Admin/TransCompany/list',
              data: {
                "keyWord": keyWord,
                "start": start,
                "length": length,
                "orderList": []
              },
              headers: _headers())
          .then((res) {
        if (res['status'] == 'success') {
          return CompanyListModel.fromJson(res['data']);
        } else {
          throw res['message'];
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> transCompanyCreateOrUpdate(CompanyAddUpdateModel m) {
    return _httpUtil.postreq('/api/Admin/TransCompany/CreateOrUpdate',
        headers: _headers(),
        data: {
          "companyGuid": m.currentCompany!.guid,
          "userGuid": m.superUser!.guid,
          "companyName": m.currentCompany!.companyName,
          "bin": m.currentCompany!.bin,
          "email": m.superUser!.email,
          "phone": m.superUser!.phone,
          "userName": m.superUser!.name,
          "givenName": m.superUser!.givenName,
          "surname": m.superUser!.surname,
          "password": m.superUser!.password,
          "confirmPassword": m.superUser!.password,
          "businessLicenseUrl": m.currentCompany!.businessLicenseUrl,
          "legalRepresentativeName": m.currentCompany!.legalRepresentativeName,
          "legalRepresentativeId": m.currentCompany!.legalRepresentativeId,
          "info": m.currentCompany!.info,
          "logoUrl": m.currentCompany!.logoUrl,
          "tin": m.currentCompany!.tin,
          "ogrn": m.currentCompany!.ogrn,
          "okpo": m.currentCompany!.okpo,
          "trn": m.currentCompany!.trn,
          "rrc": m.currentCompany!.rrc
        }).then((res) {
      if (res['status'] == 'success') {
        return true; //CompanyAddUpdateModel.fromJson(res);
      } else {
        return res['message'];
      }
    });
  }

  Future<dynamic> transCompanyId(String guid) {
    return _httpUtil
        .getreq('/api/Admin/TransCompany/$guid', headers: _headers())
        .then((res) {
      if (res.isNotEmpty) {
        if (res['status'] == 'success') {
          return CompanyAddUpdateModel.fromJson(res['data']);
        } else {
          return res['message'];
        }
      } else {
        return null;
      }
    });
  }

  Future<dynamic> baseDataInfo() {
    return _httpUtil
        .postreq('/api/Admin/BaseDataInfo', headers: _headers())
        .then((res) {
      if (res['status'] == 'success') {
        return BaseAdminModel.fromJson(res['data']);
      } else {
        return res['message'];
      }
    });
  }

  Future<AdminModel> adminId(String aguid) {
    try {
      return _httpUtil
          .getreq('/api/Admin/Admin/$aguid', headers: _headers())
          .then((res) {
        if (res['status'] == 'success') {
          print(res.toString());
          return AdminModel.fromJson(res['data']); // there is object
        } else {
          throw res['message'];
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> adminCreateOrUpdate(AdminModel model) {
    try {
      return _httpUtil
          .postreq('/api/Admin/Admin/CreateOrUpdate',
              data: {
                "guid": model.guid,
                "adminTypeGuid": model.adminTypeGuid,
                "name": model.name,
                "givenName": model.givenName,
                "surname": model.surname,
                "phone": model.phone,
                "email": model.email,
                "password": model.password,
                "autograph": model.autograph ?? '',
                "avatarUrl": model.avatarUrl ?? '',
                "birthday": model.birthday ?? 0,
                "gender": model.gender ?? 0,
              },
              headers: _headers())
          .then((res) {
        if (res['status'] == 'success') {
          return true;
        } else {
          throw res['message'];
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> adminStatus() {
    return _httpUtil
        .postreq(
      '/api/Admin/Admin/Status',
      headers: _headers(),
    )
        .then((res) {
      if (res['status'] == 'success') {
        return; // there is object
      } else {
        return res['message'];
      }
    });
  }

  Future<AdminListModel> adminList(
      {required int? start,
      required int length,
      String? keyWord = '',
      bool isAll = false}) async {
    return await _httpUtil
        .postreq(
      '/api/Admin/Admin/list',
      data: {
        "keyWord": keyWord,
        "start": start,
        "length": length,
        "isAll": isAll ? 1 : 0,
        "orderList": [
          {"column": 0, "dir": ""}
        ]
      },
      headers: _headers(),
    )
        .then((res) {
      if (res['status'] == 'success') {
        return AdminListModel.fromJson(res['data']);
      } else {
        throw res['message'];
      }
    });
  }

  Future<TransUserListModel> transUserlist(
      {required int? start, required int length, String? keyWord = ''}) async {
    return _httpUtil
        .postreq(
      '/api/Admin/TransUser/list',
      data: {
        "keyWord": keyWord,
        "start": start,
        "length": length,
        "isAll": 0,
        "orderList": [
          {"column": 0, "dir": ""}
        ]
      },
      headers: _headers(),
    )
        .then((res) {
      if (res['status'] == 'success') {
        return TransUserListModel.fromJson(res['data']);
      } else {
        throw res['message'];
      }
    });
  }

  Future<dynamic> setStatus(SetStatusModel seter) async {
    log(seter.toJson().toString());
    try {
      return _httpUtil
          .postreq('/api/Admin/Admin/Status',
              data: {"guidList": seter.guidList, "type": seter.type},
              headers: _headers())
          .then((res) {
        if (res['status'] == 'success') {
          return true;
        } else {
          throw res['message'];
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> checkAuth() async {
    return storage.read('a_at').then((t) {
      if (t.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    });
  }

  @override
  void logout() async {
    await storage.delete('a_at');
    await storage.delete('a_rt');
  }

  Map<String, String> _headers({String? token}) => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token ?? _accessToken}',
        'access-control-allow-origin': '*',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive'
      };
}
