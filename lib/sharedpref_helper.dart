import 'package:shared_preferences/shared_preferences.dart';

class SharedprefHelper {
  static SharedPreferences? sharedprefHelper;

  static initSharedprefHelper() async {
    sharedprefHelper = await SharedPreferences.getInstance();
  }

  static saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedprefHelper?.setString(key, value);
    }
    if (value is bool) {
      return await sharedprefHelper?.setBool(key, value);
    }
    if (value is int) {
      return await sharedprefHelper?.setInt(key, value);
    }
    if (value is double) {
      return await sharedprefHelper?.setDouble(key, value);
    }
  }

  static getData({
    required String key,
  }) {
    return sharedprefHelper?.get(key);
  }

  static removeData({required String key}) {
    return sharedprefHelper?.remove(key);
  }

  static clearData() {
    return sharedprefHelper?.clear();
  }
}