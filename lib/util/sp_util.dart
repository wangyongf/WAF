import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class SPUtil {
  static SharedPreferences _prefs;

  static SPUtil _instance;

  static Future<SPUtil> getInstance() async {
    if (_instance == null) {
      // TODO: synchronized is deprecated.
      await synchronized(_lock, () async {
        if (_instance == null) {
          _instance = SPUtil._();
          await _instance._init();
        }
      });
    }
    return _instance;
  }

  SPUtil._();

  static Object _lock = Object();

  _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  getSP() {
    return _prefs;
  }
}

//SPUtil.getInstance().then((spUtil){
//SharedPreferences sp =  spUtil.getSP();
//});
