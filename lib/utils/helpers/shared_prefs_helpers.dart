import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static final SharedPreferenceHelper _shared =
  SharedPreferenceHelper._private();

  factory SharedPreferenceHelper() => _shared;

  SharedPreferenceHelper._private();

  // Future<void> saveString({required String key, dynamic value}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, value);
  // }
  //
  // Future<void> saveBool({required String key, required bool value}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(key, value);
  // }

  Future<dynamic> save( // generic method
          {required String key,
        dynamic value,
        required SaveType type}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case SaveType.boolType:
        {
          prefs.setBool(key, value);
        }
        break;
      case SaveType.stringType:
        {
          prefs.setString(key, value);
        }
        break;
      case SaveType.intType:
        {
          prefs.setInt(key, value);
        }
        break;
      case SaveType.doubleType:
        {
          prefs.setDouble(key, value);
        }
        break;
      case SaveType.stringListType:
        {
          prefs.setStringList(key, value);
        }
        break;
    }
  }

  // Future<String?> readString({required String key}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(key);
  // }
  //
  // Future<bool?> readBool({required String key}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(key);
  // }

  Future<void> read( // generic method
          {required String key,
        required SaveType type}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case SaveType.boolType:
        {
          prefs.getBool(key);
        }
        break;
      case SaveType.stringType:
        {
          prefs.getString(key);
        }
        break;
      case SaveType.intType:
        {
          prefs.getInt(key);
        }
        break;
      case SaveType.doubleType:
        {
          prefs.getDouble(key);
        }
        break;
      case SaveType.stringListType:
        {
          prefs.getStringList(key);
        }
        break;
    }
  }
}
enum SaveType {
  stringType,
  boolType,
  intType,
  doubleType,
  stringListType,
}