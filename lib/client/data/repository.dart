import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/model/subcompany_model.dart';
import 'package:tasu/client/model/models.dart';
import 'package:tasu/global/data/services/repository.dart';
import 'package:tasu/global/model/login_model.dart';
import 'package:tasu/global/utils/http_util_c.dart';
import 'package:tasu/global/utils/utils.dart';
import 'package:tasu/main.dart';

import '../futures/settings/view/sub/futures/classifiers/model/models.dart';
import '../futures/settings/view/sub/futures/organization/model/models.dart';

class ClientRepository extends Repository {
  // final HttpController _http = HttpController();
  final HttpUtilC _httpUtil = HttpUtilC();

  ClientRepository._() {
    storage.read('c_at').then((value) {
      _accessToken = value;
    }).catchError(onError);
  }
  static final ClientRepository _repository = ClientRepository._();
  factory ClientRepository() => _repository;

//! Auth repositiry👇
  String? _accessToken;

  @override
  Future<LoginModel> login(
      {required String loginName, required String password}) {
    try {
      return _httpUtil.postreq('/api/Login/Users', headers: _headers(), data: {
        "loginName": "user1@gmail.com",
        "password": "12345678"
      }).then((res) {
        if (res['status'] == 'success') {
          late LoginModel loginModel;
          loginModel = LoginModel.fromJson(res);

          saveToken(
              loginModel.data!.accessToken!, loginModel.data!.refreshToken!);
          return loginModel;
        } else {
          throw res['message'];
        }
      }).catchError(onError);
    } catch (e) {
      rethrow;
    }
  }

  void saveToken(String cat, String crt) async {
    _accessToken = cat;
    await storage.write('c_at', cat);
    await storage.write('c_rt', crt);
    await storage.write('isAdmin', '0');
  }

  @override
  Future<bool> checkAuth() async {
    return storage.read('c_at').then((t) {
      if (t.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }).catchError(onError);
  }

  @override
  void logout() async {
    await storage.delete('c_at');
    await storage.delete('c_rt');
  }

  @override
  Future<dynamic> renewToken() async {
    return _httpUtil.postreq('/api/Login/RenewTokens',
        headers: _headers(),
        data: {"token": "ullamco consectetu", "type": 2}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//!  Settings repository
//? Handbook
//* Employee position

  Future<dynamic> employeePositionId() async {
    _httpUtil.getreq('u/api/settings/Handbook/EmployeePosition/',
        headers: _headers(),
        params: {'id': 'proident veniam elit Lorem aliqua'}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> employeePositionCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Handbook/EmployeePosition/CreateOrUpdate',
        headers: _headers(),
        data: {"guid": "Duis Lorem", "name": "labore nostrud"}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> employeePositionStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/EmployeePosition/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> employeePositionList() async {
    return _httpUtil.postreq('/api/settings/Handbook/EmployeePosition/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//* Vat rate
  Future<dynamic> vatRateId() async {
    return _httpUtil
        .getreq(
      '/api/settings/Handbook/VatRate/:id',
      params: {'id': 'id'},
      headers: _headers(),
    )
        .then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> vatRateCreateUpdate() async {
    return _httpUtil.postreq('/api/settings/Handbook/VatRate/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "cons",
          "name": "sunt Duis",
          "vatLaw": "pariatur ullamco",
          "vatCode": "ea ut proident",
          "thirdPartyCode": "dolore consequat deserunt labore non",
          "rate": -4697428,
          "isActive": 30493213,
          "isCountVat": 39443115,
          "isDefaultVatRate": -58493412
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> vatRateStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/VatRate/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> vatRateList() async {
    return _httpUtil.postreq('/api/settings/Handbook/VatRate/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  Trip status
  Future<dynamic> tripStatusId() async {
    return _httpUtil.getreq('/api/settings/Handbook/TripStatus/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> tripStatusCreateUpdate() async {
    return _httpUtil.postreq('/api/settings/Handbook/TripStatus/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "nostrud Lorem mollit",
          "statusTypeId": -79249164,
          "statusTypeName": "in ut",
          "name": "adipisicing enim quis",
          "priority": 19468417,
          "isChangeCargoStatus": -96198002
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> tripStatusStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/TripStatus/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> tripStatusList() async {
    return _httpUtil.postreq('/api/settings/Handbook/TripStatus/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  Transport type
  Future<dynamic> transportTypeId() async {
    return _httpUtil.getreq('/api/settings/Handbook/TransportType/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> transportTypeCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Handbook/TransportType/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "voluptate qui Ut sint",
          "name": "in est",
          "isRailway": -81542414
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> transportTypeStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/TransportType/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> transportTypeList() async {
    return _httpUtil.postreq('/api/settings/Handbook/TransportType/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 0,
          "length": 0,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  TransTag
  Future<dynamic> transTagId() async {
    return _httpUtil.getreq('/api/settings/Handbook/TransTag/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> transTagCreateUpdate() async {
    return _httpUtil.postreq('/api/settings/Handbook/TransTag/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "dolore ad nisi exercitation elit",
          "name": "quis veniam id",
          "isActive": -2660745
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> transTagStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/TransTag/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> transTagList() async {
    return _httpUtil.postreq('/api/settings/Handbook/TransTag/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  SalesFunnelStatus
  Future<dynamic> salesFunnelStatusId() async {
    return _httpUtil.getreq('/api/settings/Handbook/SalesFunnelStatus/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> salesFunnelStatusCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Handbook/SalesFunnelStatus/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "dolore ad nisi exercitation elit",
          "name": "quis veniam id",
          "isActive": -2660745
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> salesFunnelStatusStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/SalesFunnelStatus/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> salesFunnelStatusList() async {
    return _httpUtil.postreq('/api/settings/Handbook/SalesFunnelStatus/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  SalesFunnelResult
  Future<dynamic> salesFunnelResultId() async {
    return _httpUtil.getreq('/api/settings/Handbook/SalesFunnelResult/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> salesFunnelResultCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Handbook/SalesFunnelResult/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "eu Lorem",
          "name": "incididunt in nulla",
          "resultId": -40999858,
          "isToNextStep": 57632001
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> salesFunnelResultStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/SalesFunnelResult/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> salesFunnelResultList() async {
    return _httpUtil.postreq('/api/settings/Handbook/SalesFunnelResult/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  SrderStatus
  Future<dynamic> orderStatusId() async {
    return _httpUtil.getreq('/api/settings/Handbook/OrderStatus/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> orderStatusCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Handbook/OrderStatus/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "sit eiusmod nulla",
          "name": "ut proident sint velit fugiat",
          "priority": -92852997,
          "statusType": 80308694,
          "textColor": "ex Duis cupidatat",
          "backgroundColour": "minim aliquip",
          "msgSellerGuid": "veniam in e",
          "twig": "dolore officia u"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> orderStatusStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/OrderStatus/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> orderStatusList() async {
    return _httpUtil.postreq('/api/settings/Handbook/OrderStatus/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  RailwayStation
  Future<dynamic> railwayStationId() async {
    return _httpUtil.getreq('/api/settings/Handbook/RailwayStation/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> railwayStationCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Handbook/RailwayStation/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "dolore ad nisi exercitation elit",
          "name": "quis veniam id",
          "isActive": -2660745
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> railwayStationStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/RailwayStation/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> railwayStationList() async {
    return _httpUtil.postreq('/api/settings/Handbook/RailwayStation/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  PaymentType
  Future<dynamic> paymentTypeId() async {
    return _httpUtil.getreq('/api/settings/Handbook/PaymentType/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> paymentTypeCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Handbook/PaymentType/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "sunt labore velit",
          "name": "commodo aliquip officia",
          "isDefault": -74171140
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> paymentTypeStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/PaymentType/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> paymentTypeList() async {
    return _httpUtil.postreq('/api/settings/Handbook/PaymentType/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  Country
  Future<dynamic> countryId() async {
    return _httpUtil.getreq('/api/settings/Handbook/Country/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> countryCreateUpdate() async {
    return _httpUtil.postreq('/api/settings/Handbook/Country/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "irure",
          "name": "culpa ipsum",
          "code": "est eiusmod irure",
          "isDefault": 94354701
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> countryStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/Country/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> pcountryList() async {
    return _httpUtil.postreq('/api/settings/Handbook/Country/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  ContactType
  Future<dynamic> contactTypeId() async {
    return _httpUtil.getreq('/api/settings/Handbook/ContactType/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> contactTypeCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Handbook/ContactType/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "irure",
          "name": "culpa ipsum",
          "code": "est eiusmod irure",
          "isDefault": 94354701
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> contactTypeStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/ContactType/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> contactTypeList() async {
    return _httpUtil.postreq('/api/settings/Handbook/ContactType/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  ContactPersonPost
  Future<dynamic> contactPersonPostId() async {
    return _httpUtil.getreq('/api/settings/Handbook/ContactPersonPost/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> contactPersonPostCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Handbook/ContactPersonPost/CreateOrUpdate',
        headers: _headers(),
        data: {"guid": "Duis Lorem", "name": "labore nostrud"}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> contactPersonPostStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/ContactPersonPost/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> contactPersonPostList() async {
    return _httpUtil.postreq('/api/settings/Handbook/ContactPersonPost/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  ClientType
  Future<dynamic> clientTypeId() async {
    return _httpUtil.getreq('/api/settings/Handbook/ClientType/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> clientTypeStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/ClientType/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> clientTypeList() async {
    return _httpUtil.postreq('/api/settings/Handbook/ClientType/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  CargoStatus
  Future<dynamic> cargoStatusId() async {
    return _httpUtil.getreq('/api/settings/Handbook/CargoStatus/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> cargoStatusCreateUpdate() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/CargoStatus/CreateOrUpdate',
      headers: _headers(),
      data: {
        "guid": "culpa id Duis",
        "name": "exercitation ad",
        "isActive": -64854607,
        "isInitial": 39441817,
        "isFinal": -51724634
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> cargoStatusStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/CargoStatus/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<CargoStatusModel> cargoStatusList() async {
    return _httpUtil.postreq('/api/settings/Handbook/CargoStatus/list',
        headers: _headers(),
        data: {
          "keyWord": "",
          "start": 0,
          "length": 0,
          "isAll": 0,
          "orderList": [
            {"column": 0, "dir": ""},
            {"column": 0, "dir": ""}
          ]
        }).then((res) {
      print(json.encode(res));
      if (res['status'] == 'success') {
        return CargoStatusModel.fromJson(res['data']);
      } else {
        throw res['message'];
      }
    }).catchError(onError);
  }

//*  PaymentDelayTerm
  Future<dynamic> paymentDelayTermId() async {
    return _httpUtil.getreq('/api/settings/Handbook/PaymentDelayTerm/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> paymentDelayTermCreateUpdate() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/PaymentDelayTerm/CreateOrUpdate',
      headers: _headers(),
      data: {
        "guid": "culpa id Duis",
        "name": "exercitation ad",
        "isActive": -64854607,
        "isInitial": 39441817,
        "isFinal": -51724634
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> paymentDelayTermStatus() async {
    return _httpUtil.postreq('/api/settings/Handbook/PaymentDelayTerm/Status',
        headers: _headers(),
        data: {
          "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
          "type": "proident"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> paymentDelayTermList() async {
    return _httpUtil.postreq('/api/settings/Handbook/PaymentDelayTerm/list',
        headers: _headers(),
        data: {
          "keyWord": "nisi exercitation quis nostrud irure",
          "start": 13941826,
          "length": 7461577,
          "isAll": 62119638,
          "orderList": [
            {"column": -73043242, "dir": "incididunt exercitation sed do"},
            {"column": 9070016, "dir": "dolore"}
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//*  Bank
  Future<dynamic> bankId() async {
    return _httpUtil.getreq('/api/settings/Handbook/Bank/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> bankCreateUpdate() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/Bank/CreateOrUpdate',
      headers: _headers(),
      data: {
        "guid": "consectetur commodo",
        "name": "eiusmod non deserunt nisi",
        "unofficialName": "tempor consequat in ipsum",
        "branch": "enim aute",
        "code": "Ut adipisicing sint incididunt id",
        "swift": "deserunt sunt enim",
        "countryGuid": "minim aliquip ullamco",
        "city": "ut elit",
        "address": "dolore non sint aute",
        "postCode": "fugiat aute"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> bankStatus() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/Bank/Status',
      headers: _headers(),
      data: {
        "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
        "type": "proident"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<BankModel> bankList() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/Bank/list',
      headers: _headers(),
      data: {
        "keyWord": "",
        "start": 0,
        "length": 0,
        "isAll": 0,
        "orderList": [
          {"column": -0, "dir": ""},
          {"column": 0, "dir": ""}
        ]
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return BankModel.fromJson(res['data']); //  object there
      } else {
        throw res['message'];
      }
    }).catchError(onError);
  }

//* Deferredpaymentterm

  Future<dynamic> deferredpaymenttermId() async {
    return _httpUtil.getreq('/api/settings/Handbook/Deferredpaymentterm/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> deferredpaymenttermCreateUpdate() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/Deferredpaymentterm/CreateOrUpdate',
      headers: _headers(),
      data: {
        "guid": "consectetur commodo",
        "name": "eiusmod non deserunt nisi",
        "unofficialName": "tempor consequat in ipsum",
        "branch": "enim aute",
        "code": "Ut adipisicing sint incididunt id",
        "swift": "deserunt sunt enim",
        "countryGuid": "minim aliquip ullamco",
        "city": "ut elit",
        "address": "dolore non sint aute",
        "postCode": "fugiat aute"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> deferredpaymenttermStatus() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/Deferredpaymentterm/Status',
      headers: _headers(),
      data: {
        "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
        "type": "proident"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<DeferredpaymenttermModel> deferredpaymenttermList() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/Deferredpaymentterm/list',
      headers: _headers(),
      data: {"keyWord": "", "start": 0, "length": 0, "isAll": 0},
    ).then((res) {
      if (res['status'] == 'success') {
        return DeferredpaymenttermModel.fromJson(res['data']);
      } else {
        throw res['message'];
      }
    }).catchError(onError);
  }

//* Deferredpaymentterm

  Future<dynamic> activityAreaId() async {
    return _httpUtil.getreq('/api/settings/Handbook/activityArea/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> activityAreaCreateUpdate() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/activityArea/CreateOrUpdate',
      headers: _headers(),
      data: {
        "guid": "consectetur commodo",
        "name": "eiusmod non deserunt nisi",
        "unofficialName": "tempor consequat in ipsum",
        "branch": "enim aute",
        "code": "Ut adipisicing sint incididunt id",
        "swift": "deserunt sunt enim",
        "countryGuid": "minim aliquip ullamco",
        "city": "ut elit",
        "address": "dolore non sint aute",
        "postCode": "fugiat aute"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> activityAreaStatus() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/activityArea/Status',
      headers: _headers(),
      data: {
        "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
        "type": "proident"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<ActivityAreaModel> activityAreaList() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/activityArea/list',
      headers: _headers(),
      data: {"keyWord": "", "start": 0, "length": 0, "isAll": 0},
    ).then((res) {
      print(json.encode(res));
      if (res['status'] == 'success') {
        return ActivityAreaModel.fromJson(res['data']);
      } else {
        throw res['message'];
      }
    }).catchError(onError);
  }

// *

//* Handbook Root
  Future<dynamic> tripStatusTypeList() async {
    return _httpUtil.getreq('/api/settings/Handbook/TripStatusType/list',
        headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> taskStatusList() async {
    return _httpUtil.getreq('/api/settings/Handbook/TaskStatus/list',
        headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> salesFunnelResultTypeList() async {
    return _httpUtil.getreq(
      '/api/settings/Handbook/SalesFunnelResultType/list',
      headers: {},
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> clientypeCreateUpdate() async {
    return _httpUtil.postreq(
      '/api/settings/Handbook/Clientype/CreateOrUpdate',
      headers: _headers(),
      data: {
        "guid": "id quis",
        "name": "dolore irure aliquip aliqua",
        "priority": 86691727,
        "color": "Excepteur sint est",
        "isDefault": -30049704
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//? Organization
//* SubCompany
  Future<dynamic> subCompanyId() async {
    return _httpUtil.getreq('/api/settings/Organization/SubCompany/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> subCompanyCreateUpdate() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/SubCompany/CreateOrUpdate',
      headers: _headers(),
      data: {
        "guid": "dolor dolore",
        "name": "tempor sed",
        "code": "deserunt ",
        "codeTypeId": -68951057,
        "isMainCompany": -21925762,
        "logoUrl": "exercitation non magna do",
        "ogrn": "no",
        "rrc": "aliquip sit dolor",
        "info": "Ut velit",
        "directorName": "eiusmod fugiat ea non",
        "nameOfWhom": "cupidatat cillum",
        "nameOriginal": "pariatur incididunt ad in",
        "vatRateGuid": "exercitation",
        "postGuid": "Lorem dolor",
        "pricingType": "voluptate ea tempor",
        "correspondentAccount": "nulla Duis ut",
        "print": "nisi tempor qui",
        "signature": "occaecat fugiat tempor",
        "contactInfo": {
          "guid": "ea labore",
          "countryGuid": "tempor eiusmod aliqua",
          "city": "ipsum nulla dolore",
          "address": "dolore reprehenderit fugiat voluptate",
          "postCode": "deserunt magna fugiat",
          "phone": "ea",
          "fax": "nostrud quis",
          "email": "anim quis qui",
          "website": "nostrud ut"
        },
        "correspondentInfo": {
          "guid": "ea do eu est",
          "countryGuid": "nostrud anim enim",
          "city": "Lorem quis",
          "address": "officia ut",
          "postCode": "aute",
          "phone": "qui dolor dolore in",
          "fax": "adipisicing in est Lorem",
          "email": "incididunt sint aliqua",
          "website": "ullamco Duis irure sunt"
        },
        "bank": {
          "name": "ipsum ut quis",
          "account": "ea sit nisi ipsum",
          "code": "consectetur dolor amet mollit",
          "swift": "do ullamco"
        },
        "bankInvoiceList": [
          {
            "guid": "elit",
            "account": "voluptate anim incididunt sunt et",
            "correspondentBankGuid": "dolor nisi",
            "currencyId": -81677935
          },
          {
            "guid": "esse consequat in",
            "account": "ea deserunt",
            "correspondentBankGuid": "in exercitation consequat adipisicing do",
            "currencyId": -47898486
          }
        ]
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> subCompanyStatus() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/SubCompany/Status',
      headers: _headers(),
      data: {
        "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
        "type": "proident"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<SubCompanyModel> subCompanyList() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/SubCompany/list',
      headers: _headers(),
      data: {
        "keyWord": "",
        "start": 0,
        "length": 0,
        "isAll": 1,
        "orderList": [
          {"column": 0, "dir": "incididunt exercitation sed do"},
          {"column": 0, "dir": "dolore"}
        ]
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return SubCompanyModel.fromJson(res['data']); //  object there
      } else {
        throw res['message'];
      }
    }).catchError(onError);
  }

  //* Department
  Future<dynamic> departmentId() async {
    return _httpUtil.getreq('/api/settings/Organization/Department/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> departmentCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Organization/Department/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "voluptate aliqua nulla",
          "belongGuid": "id reprehenderit",
          "name": "deserunt ",
          "code": "ipsum labore"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> departmentStatus() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/Department/Status',
      headers: _headers(),
      data: {
        "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
        "type": "proident"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<DepartmentModel> departmentList() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/Department/list',
      headers: _headers(),
      data: {
        "keyWord": "nisi exercitation quis nostrud irure",
        "start": 0,
        "length": 0,
        "isAll": 1,
        "orderList": [
          {"column": 0, "dir": ""},
          {"column": 0, "dir": ""}
        ]
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return DepartmentModel.fromJson(res['data']);
      } else {
        return res['message'];
      }
    });
  }

//* Employee
  Future<dynamic> employeeId() async {
    return _httpUtil.getreq('/api/settings/Organization/employee/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> employeeCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Organization/employee/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "voluptate aliqua nulla",
          "belongGuid": "id reprehenderit",
          "name": "deserunt ",
          "code": "ipsum labore"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> employeeStatus() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/employee/Status',
      headers: _headers(),
      data: {
        "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
        "type": "proident"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<EmployeeModel> employeeList() async {
    print(_accessToken);

    return _httpUtil.postreq(
      '/api/settings/Organization/employee/list',
      headers: _headers(),
      data: {
        "keyWord": "nisi exercitation quis nostrud irure",
        "start": 0,
        "length": 0,
        "isAll": 1,
        "orderList": [
          {"column": 0, "dir": ""},
          {"column": 0, "dir": ""}
        ]
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return EmployeeModel.fromJson(res['data']);
      } else {
        return res['message'];
      }
    });
  }

  //* UserGroup
  Future<dynamic> userGroupId() async {
    return _httpUtil.getreq('/api/settings/Organization/UserGroup/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> userGroupCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Organization/UserGroup/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "sit sint Ut aute",
          "name": "anim do in",
          "specialRightIds": [87686171, 23611930],
          "paymentList": [
            {
              "guid": "ipsum sed fugiat",
              "permitTypeId": -54881774,
              "permitActionId": 69703037,
              "isActive": -94128832
            },
            {
              "guid": "amet pariat",
              "permitTypeId": 78088884,
              "permitActionId": -88820298,
              "isActive": 75017879
            }
          ],
          "actionList": [
            {"guid": "s", "actionTypeId": -65440027, "actionId": 35278684},
            {
              "guid": "et Excepteur",
              "actionTypeId": 19287220,
              "actionId": -24936909
            }
          ]
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> userGroupStatus() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/UserGroup/Status',
      headers: _headers(),
      data: {
        "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
        "type": "proident"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> userGroupList() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/UserGroup/list',
      headers: _headers(),
      data: {
        "keyWord": "nisi exercitation quis nostrud irure",
        "start": 13941826,
        "length": 7461577,
        "isAll": 62119638,
        "orderList": [
          {"column": -73043242, "dir": "incididunt exercitation sed do"},
          {"column": 9070016, "dir": "dolore"}
        ]
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//* Numeration
  Future<dynamic> numerationId() async {
    return _httpUtil.getreq('/api/settings/Organization/Numeration/',
        params: {'id': 'id'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> numerationCreateUpdate() async {
    return _httpUtil.postreq(
        '/api/settings/Organization/Numeration/CreateOrUpdate',
        headers: _headers(),
        data: {
          "guid": "esse irure qui non occaecat",
          "name": "ipsum occaecat eu do",
          "userGuid": "exercitation dolore",
          "numTypeId": -47276427,
          "subCompanyGuid": "nulla dolore laborum voluptate ips",
          "index": -80214852,
          "prefix": "sit Lorem",
          "suffix": "ad Duis cillum",
          "digit": 99697369,
          "hasYear": -35404649,
          "hasMonth": -2475644,
          "delimiter": "aliquip eiusmod qui"
        }).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> numerationStatus() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/Numeration/Status',
      headers: _headers(),
      data: {
        "guidList": ["mollit officia dolor", "nostrud adipisicing aliqua"],
        "type": "proident"
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> numerationList() async {
    return _httpUtil.postreq(
      '/api/settings/Organization/Numeration/list',
      headers: _headers(),
      data: {
        "keyWord": "nisi exercitation quis nostrud irure",
        "start": 13941826,
        "length": 7461577,
        "isAll": 62119638,
        "orderList": [
          {"column": -73043242, "dir": "incididunt exercitation sed do"},
          {"column": 9070016, "dir": "dolore"}
        ]
      },
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

//* Organization Root
  Future<dynamic> specialRightList() async {
    return _httpUtil
        .getreq(
      '/api/settings/Organization/SpecialRight/list',
      headers: _headers(),
    )
        .then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> groupActionTypeList() async {
    return _httpUtil.getreq(
      '/api/settings/Organization/GroupActionType/list',
      headers: {},
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> groupActionList() async {
    return _httpUtil.getreq(
      '/api/settings/Organization/GroupAction/list',
      headers: {},
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> permitTypeList() async {
    return _httpUtil.getreq(
      '/api/settings/Organization/PermitType/list',
      headers: {},
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> permitActionList() async {
    return _httpUtil.getreq(
      '/api/settings/Organization/PermitAction/list',
      headers: {},
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> companyCodeTypeList() async {
    return _httpUtil.getreq(
      '/api/settings/Organization/CompanyCodeType/list',
      headers: {},
    ).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<CurrencyModel> currencyList() async {
    print(_accessToken);
    return _httpUtil
        .getreq(
      '/api/settings/Handbook/Currency/list',
      headers: _headers(),
    )
        .then((res) {
      if (res['status'] == 'success') {
        return CurrencyModel.fromJson(res['data']);
      } else {
        throw res['message'];
      }
    }).catchError(onError);
  }

  //!  User repository
  //? User
  Future<dynamic> currnetUserInfo() async {
    return _httpUtil
        .getreq('/api/User/CurrentUserInfo', headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> getCurrentUserCompanyInfo() async {
    return _httpUtil
        .getreq('/api/User/GetCurrentUserCompanyInfo', headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> userInfo() async {
    return _httpUtil.getreq('/api/User/Info?userGuid',
        params: {'userGuid': 'userGuid'}, headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  //!  Api
  Future<dynamic> navigationList() async {
    return _httpUtil
        .getreq('/api/Site/NavigationList', headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  //! Client
  Future<dynamic> clientCompany() async {
    return _httpUtil
        .getreq('/api/settings/Client/ClientCompany/', headers: {}).then((res) {
      if (res['status'] == 'success') {
        return; //  object there
      } else {
        return res['message'];
      }
    }).catchError(onError);
  }

  Future<dynamic> clientCompanyCreateOrUpdate() async {}

  @override
  init() {}
  @override
  dispose() {
    _httpUtil.close();
    // _http.close();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    bool p = Platform.isMacOS && Platform.isWindows;
    if (!p) {
      Utils.toast(error.toString());
    }
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
