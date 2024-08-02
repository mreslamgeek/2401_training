import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/api_constans.dart';
import 'package:flutter_application_1/utils/exceptions.dart';
import 'package:flutter_application_1/utils/toast_helper.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum RequestType { GET, POST, PUT, DELETE }

Future<String?> _getCookie() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('tokken');
}

class BaseRequest {
  static get _domain => ApiConstants.baseUrl;

  static final _connectionChecker = InternetConnectionChecker();

  static var _errorMsg = 'Something went wrong';
  static String? _cookie;
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _domain,
      // will not throw errors
      validateStatus: (status) => true,
      receiveDataWhenStatusError: true,
      followRedirects: false,
      // validateStatus: (status) => status! < 500,
    ),
  );

  static Future<dynamic> dynamicRequest({
    required String path,
    RequestType requestType = RequestType.GET,
    dynamic body,
    Map<String, dynamic>? parms,
    bool useAuth = true,
    bool showResponse = false,
    bool showServerMsg = false,
  }) async {
    try {
      if (!kIsWeb) {
        if (!await _connectionChecker.hasConnection) {
          throw NetworkException();
        }
      }

      //log request
      _cookie = await _getCookie();
      log("$_domain$path -{$_cookie}");

      final response = await _dio.request(
        path,
        data: body,
        queryParameters: parms,
        options: Options(
          method: requestType.name,
          headers: {
            if (_cookie != null && useAuth) 'Authorization': 'Bearer $_cookie',
            // 'Accept-Language': language,
            // 'X-localization': language,
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
        ),
      );

      if (showResponse) {
        log(response.statusCode.toString());
        log(response.data.toString());
      }

      if (response.data?["success"] == false) {
        if (response.data["message"] != null) {
          throw ServerException(response.data["message"]);
        } else {
          throw RequestException('Server Error | Code : ${response.statusCode}');
        }
      }

      if (showServerMsg) showSuccessToast(response.data["message"]);

      // return response.data["result"];
      return response.data;
    } on ErrorExceptions catch (err) {
      log(err.toString());
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showErrorToast(err.errorMSG);
      });
      return null;
    } on DioException catch (err, stackTrace) {
      log('error:$err');
      log('Stack Trace:$stackTrace');

      if (err.message != null) _errorMsg = err.message!;
      showErrorToast(_errorMsg);
      return null;
    } catch (err, stackTrace) {
      log(">>>>>>>>>>>>>START>>>>>>>>>>>>>>");
      log("<<<<<<<<<<<<END<<<<<<<<<<<<<");

      log('error:$err');
      log('Stack Trace:$stackTrace');

      showErrorToast(_errorMsg);
      return null;
    }
  }
}
