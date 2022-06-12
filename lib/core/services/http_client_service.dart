import 'dart:convert';
import 'dart:developer';

import 'package:artway_web/app/constant/http_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

/// written this class for http client
class HttpClientService {
  final Map<String, String> headers = {
    'content-type': 'application/json',
    'authorization': 'Bearer ',

    //(Get.find<SessionService>().getToken() ?? ''),
    'lang': 'tr'
  };

  /// http get method
  /// [body] Request body
  /// [apiParameters] Request body e dönştürülecek
  /// [body] var ise body body olarak geçerli olacak null ise [apiParameters] yi alıp dönüştürecek
  Future<http.Response?> get(String method,
      {Map<String, String> apiParameters = const {},
      required Map<String, String>? header,
      String body = ''}) async {
    try {
      if (body != '') {
        body = '/' + body;
      }
      // Sends an HTTP get
      //var response = await http.get(Uri.parse(HttpUrl.baseUrl + method + body), headers: header);
      var response =
          await http.get(Uri.https(HttpUrl.baseUrl, method + body, apiParameters), headers: header);
      _logS(HttpUrl.baseUrl + '/' + method, header, response.body, '');
      if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.notFound) {
        return response;
      } else if (response.statusCode == HttpStatus.unauthorized) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == HttpStatus.internalServerError) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on FormatException catch (e) {
      debugPrint(e.toString());
      throw Exception("Bad response format");
    } catch (e) {
      throw Exception("Hata ouştu");
    }
  }

  /// http post method
  Future<http.Response?> post(String method,
      {required Map<String, dynamic> apiParameters, required Map<String, String>? header}) async {
    //we convert the map to json
    var encodedBody = json.encode(apiParameters);
    // Sends an HTTP POST
    var response = await http.post(Uri.https(HttpUrl.baseUrl, method),
        headers: header, body: encodedBody, encoding: Encoding.getByName("application/json"));
    _logS(HttpUrl.baseUrl + '/' + method, header, response.body, encodedBody);
    //returns the resulting Json object.
    return response;
  }

  /// http delete method
  Future<http.Response?> delete(String method,
      {required Map<String, dynamic> apiParameters, Map<String, String>? header}) async {
    if (header != null) {
      header.addAll(headers);
    } else {
      header = headers;
    }
    String body = '';
    apiParameters.forEach((key, value) {
      body += '&' + key.toString() + '=' + value.toString();
    });
    //we delete the first character
    if (body != '') body = body.substring(1);
    body = body.replaceAll('(', '');
    body = body.replaceAll(')', '');
    var response =
        await http.delete(Uri.parse(HttpUrl.baseUrl + method + '?' + body), headers: header);

    return response;
  }

  /// http put method
  Future<http.Response?> put(String method,
      {required dynamic apiParameters, Map<String, String>? header}) async {
    if (header != null) {
      header.addAll(headers);
    } else {
      header = headers;
    }
    //if there is internet
    //we convert the map to json
    var encodedBody = json.encode(apiParameters);
    // Sends an HTTP POST
    var response = await http.put(Uri.https(HttpUrl.baseUrl, method),
        headers: header, body: encodedBody, encoding: Encoding.getByName("application/json"));
    _logS(HttpUrl.baseUrl + '/' + method, header, response.body, encodedBody);

    debugPrint('[PUT 👉]' + HttpUrl.baseUrl + method);
    _logS(HttpUrl.baseUrl + '/' + method, header, response.body, encodedBody);
    return response;
  }

  /// http put method
  Future<http.Response?> update(String method,
      {required Map<String, dynamic> apiParameters, Map<String, String>? header}) async {
    if (header != null) {
      header.addAll(headers);
    } else {
      header = headers;
    }
    //we convert the map to json
    var encodedBody = json.encode(apiParameters);
    // Sends an HTTP put
    var response = await http.post(Uri.parse(HttpUrl.baseUrl + method),
        headers: header, body: encodedBody, encoding: Encoding.getByName('application/json'));
    _logS(HttpUrl.baseUrl + '/' + method, header, response.body, encodedBody);
    return response;
  }

  void _logS(String url, Map<String, String>? header, String responseBody, String requestBody) {
    log('__________________________________ Http Start ___________________________________',
        name: 'Http');
    log('Api Request Url: ' + url, name: 'Http');
    log('Header: ' + jsonEncode(header), name: 'Http');
    log('Request: ' + requestBody, name: 'Http');
    log('Rsponse: ' + responseBody, name: 'Http');
    log('___________________________________ Http End ____________________________________',
        name: 'Http');
  }
}
