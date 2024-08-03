import 'package:flutter_application_1/data/base_request.dart';
import 'package:flutter_application_1/data/models/user.dart';
import 'package:flutter_application_1/utils/api_constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoApi {
  static Future<User?> login(String email, String password) async {
    final response = await BaseRequest.dynamicRequest(
      path: ApiConstants.loginUrl,
      requestType: RequestType.POST,
      body: {"email": email, "password": password},
    );

    if (response == null || response['user'] == null || response['token'] == null) return null;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('tokken', response['token']);

    return User.fromJson(response['user'] as Map<String, dynamic>);
  }

  static Future<User?> register(String email, String password, String name) async {
    final response = await BaseRequest.dynamicRequest(
      path: ApiConstants.registerUrl,
      requestType: RequestType.POST,
      body: {
        "email": email,
        "password": password,
        "name": name,
      },
    );

    if (response == null || response['user'] == null || response['token'] == null) return null;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('tokken', response['token']);

    return User.fromJson(response['user'] as Map<String, dynamic>);
  }
}
