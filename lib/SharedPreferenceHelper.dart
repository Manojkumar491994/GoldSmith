import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferencehelper{

  static Future<SharedPreferences> get _preference =>
      SharedPreferences.getInstance();
  // static reload() async => (await _preference).reload();

  static Future<bool> getBool(String key) async =>
      (await _preference).getBool(key) ?? false;

  static Future setBool(String key, bool value) async =>
      (await _preference).setBool(key, value);

}