import 'dart:convert';
import 'dart:developer';

import 'package:artway_web/app/extensions/general_extension.dart';
import 'package:artway_web/app/models/base_http_model.dart';
import 'package:artway_web/app/models/footer/instagram_model.dart';
import 'package:artway_web/core/services/http_client_service.dart';
import 'package:background_json_parser/background_json_parser.dart';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ManagerApi {
  //Post Method
  Future<BaseHttpModel> postMethod<T extends IBaseModel>(
      T model, String endPointUrl, Map<String, dynamic> body) async {
    try {
      var response = await HttpClientService().post(
        endPointUrl,
        header: {},
        apiParameters: body,
      );
      if (response!.statusCode == HttpStatus.ok) {
        T responseModel = model.fromJson(jsonDecode(response.body));

        return BaseHttpModel<T>(status: BaseModelStatus.ok, data: responseModel);
      } else {
        T responseModel = model.fromJson(jsonDecode(response.body));
        return BaseHttpModel(status: BaseModelStatus.error, data: responseModel);
      }
    } catch (e) {
      debugPrint(e.toString());
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }

  Future<BaseHttpModel> putMethod(String endPointUrl, Map<String, dynamic> body) async {
    try {
      var response = await HttpClientService().put(endPointUrl, apiParameters: body, header: {});
      if (response!.statusCode == HttpStatus.ok) {
        return BaseHttpModel(status: BaseModelStatus.ok);
      } else {
        return BaseHttpModel(status: BaseModelStatus.error);
      }
    } catch (e) {
      log(e.toString());
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }

  Future<BaseHttpModel> getMethod<T extends IBaseModel>(T model, String endPointUrl) async {
    try {
      var response = await HttpClientService().get(endPointUrl, header: {});
      if (response!.statusCode == HttpStatus.ok) {
        T responseModel = await model.backgroundJsonParser(response.body);

        return BaseHttpModel<T>(status: BaseModelStatus.ok, data: responseModel);
      } else {
        T responseModel = model.fromJson(jsonDecode(response.body));

        return BaseHttpModel(status: BaseModelStatus.error, data: responseModel);
      }
    } catch (e) {
      log(e.toString(), name: 'Api Error: getMethod');
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }

  Future<BaseHttpModel> getInstagramModel<T extends IBaseModel>(T model, String endPointUrl) async {
    try {
      var response = await HttpClientService().get(endPointUrl, header: {});
      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = jsonDecode(response.body).map<T>((el) {
          return model.fromJson(el);
        }).toList();

        return BaseHttpModel<List<T>>(status: BaseModelStatus.ok, data: responseModel);
      } else {
        return BaseHttpModel(status: BaseModelStatus.error);
      }
    } catch (e) {
      log(e.toString(), name: 'Api Error: getMethod');
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }
}
