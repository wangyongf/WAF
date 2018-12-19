import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  static putString(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static putBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static putInt(String key, int value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static putDouble(String key, double value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  static getS(String key, Function callback) async {
    SharedPreferences.getInstance().then((prefs) {
      callback(prefs.getString(key));
    });
  }

  static putUserName(String value) {
    putString("username", value);
  }

  static putPassword(String value) {
    putString("password", value);
  }

  static putCookie(String value) {
    putString("cookie", value);
  }

  static putCookieExpires(String value) {
    putString("expires", value);
  }

  static getUserName(Function callback) {
    getS("username", callback);
  }

  static getPassword(Function callback) {
    getS("password", callback);
  }

  static getCookie(Function callback) {
    getS("cookie", callback);
  }

  static getCookieExpires(Function callback) {
    getS("expires", callback);
  }
}
