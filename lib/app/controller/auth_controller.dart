import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../shares/data/model/user_model.dart';

class AuthController {
  static const String _accessTokenKey = 'access-token';
  static const String _userModelKey = 'user';

  static String? accessToken;
  static UserModel? userModel;

  static Future<void> SaveUserData(String token, UserModel user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    await sharedPreferences.setString(_userModelKey, jsonEncode(user.toJson()));
    accessToken = token;
    userModel = user;
  }

  static Future<void> loadUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenKey);
    if(accessToken==null){
      return;
    }
    userModel = UserModel.fromJson(
        jsonDecode(sharedPreferences.getString(_userModelKey)!));
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessTokenKey)!=null;

  }
  static Future<void>clearUserData() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.remove(_accessTokenKey);
    sharedPreferences.remove(_userModelKey);
    accessToken=null;
    userModel=null;
  }
}

//45:00 after start
