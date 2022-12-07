import 'dart:convert';

import 'package:admin/admin/data/cache.dart';
import 'package:admin/admin/futures/auth/login/model/login_model.dart';
import 'package:admin/admin/futures/company/model/compony_list_model.dart';
import 'package:admin/admin/futures/company/model/create_company_model.dart';
import 'package:admin/admin/model/admin_model.dart';
import 'package:admin/admin/model/baseadmin_model.dart';
import 'package:utils/utils/api_heper.dart';
import 'package:utils/utils/http_client.dart';
import 'package:utils/utils/sp.dart';

class AdminRepository {
  AdminRepository._() {
    _storage.readSecureData('a_at').then((value) {
      _accessToken = value;
    });
  }
  static final AdminRepository _adminRepository = AdminRepository._();
  factory AdminRepository() => _adminRepository;
  final NetworkUtil _networkUtil = NetworkUtil();
  final CacheClient _cacheClient = CacheClient();
  final SecureStorage _storage = SecureStorage();
  final HttpController _httpController = HttpController();

  String? _accessToken;

  final String _baseUrl = 'https://***.***.**';

  Future<dynamic> login({required String loginName, required String password}) {
    return _httpController.post('/api/Login/Admin', headers: _headers(), body: {
      "loginName": "qametaitan@gmail.com",
      "password": "12345678"
    }).then((res) {
      if (res['status'] == 'success') {
        LoginModel loginModel;
        loginModel = LoginModel.fromJson(res);
        _storage.writeSecureData('a_at', loginModel.data!.accessToken!);
        _storage.writeSecureData('a_rt', loginModel.data!.refreshToken!);
        _accessToken = loginModel.data!.accessToken!;
        return loginModel;
      } else {
        return res['message'];
      }
    });
  }

  Future<dynamic> currentAdmin() {
    return _httpController
        .get('/api/Admin/CurrentAdmin', headers: _headers())
        .then((res) {
      if (res['status'] == 'success') {
        print(res.toString());

        return AdminModel.fromJson(res['data']);
        // there is object
      } else {
        return res['message'];
      }
    });
  }

  Future<dynamic> adminstratorTypeList() {
    return _httpController
        .get(
      '/api/Admin/AdminstratorTypeList',
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

  Future<dynamic> transCompanyList() {
    return _httpController
        .post('/api/Admin/TransCompany/list',
            body: {
              "keyWord": "",
              "start": 0,
              "length": 0,
              "orderList": [
                {"column": 0, "dir": "string"}
              ]
            },
            headers: _headers())
        .then((res) {
      if (res['status'] == 'success') {
        return CompanyListModel.fromJson(res['data']);
      } else {
        return res['message'];
      }
    });
  }

  Future<dynamic> transCompanyCreateOrUpdate() {
    return _httpController.post('/api/Admin/TransCompany/CreateOrUpdate',
        headers: _headers(),
        body: {
          "companyGuid": "string",
          "userGuid": "string",
          "companyName": "string",
          "bin": "string",
          "email": "nur@mail.com",
          "phone": "string",
          "userName": "string",
          "givenName": "string",
          "surname": "string",
          "password": "string",
          "confirmPassword": "string",
          "businessLicenseUrl": "string",
          "legalRepresentativeName": "string",
          "legalRepresentativeId": "string",
          "info": "string",
          "logoUrl": "string",
          "tin": "string",
          "ogrn": "string",
          "okpo": "string",
          "trn": "string",
          "rrc": "string"
        }).then((res) {
      if (res['status'] == 'success') {
        return CreateCompanyModel.fromJson(res);
      } else {
        return res['message'];
      }
    });
  }

  Future<dynamic> transCompanyId() {
    return _httpController.get('/api/Admin/g/:id').then((res) {
      if (res['status'] == 'success') {
        return;
        // there is object
      } else {
        return res['message'];
      }
    });
  }

  Future<dynamic> baseDataInfo() {
    return _httpController
        .post('/api/Admin/BaseDataInfo', headers: _headers())
        .then((res) {
      if (res['status'] == 'success') {
        return BaseAdminModel.fromJson(res['data']);
      } else {
        return res['message'];
      }
    });
  }

  Future<dynamic> adminId() {
    return _httpController.get('/api/Admin/Admin/:id').then((res) {
      if (res['status'] == 'success') {
        return; // there is object
      } else {
        return res['message'];
      }
    });
  }

  Future<dynamic> adminCreateOrUpdate() {
    return _httpController.post('/api/Admin/Admin/CreateOrUpdate').then((res) {
      if (res['status'] == 'success') {
        return; // there is object
      } else {
        return res['message'];
      }
    });
  }

  Future<dynamic> adminStatus() {
    return _httpController
        .post(
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

  Future<dynamic> adminList() async {
    return await _networkUtil.request(
        method: Method.GET,
        url: '$_baseUrl/api/Admin/Admin/list',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_accessToken',
          'access-control-allow-origin': '*',
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive'
        },
        body: {
          "keyWord": "ad in amet",
          "start": 65360537,
          "length": 92209583,
          "orderList": [
            {"column": -34244748, "dir": "deserunt amet fugiat ad"},
            {"column": -71935867, "dir": "dolor tempor ea"}
          ]
        }).then((response) {
      if (response.statusCode == 200) {
        var res =
            json.decode(response.stream.toString()); //_utf8decoder.convert());
        if (res['status'] == 'success') {
          return; // there is object
        } else {
          return res['message'];
        }
      } else {
        return null;
      }
    });
  }

  void logout() {
    _storage.deleteSecureData('a_at');
    _storage.deleteSecureData('a_rt');
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
