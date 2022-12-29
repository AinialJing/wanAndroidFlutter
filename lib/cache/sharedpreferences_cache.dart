import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  SharedPreferences? prefs;
  static SharedPreferencesUtil? _instance;

  SharedPreferencesUtil._() {
    init();
  }

  SharedPreferencesUtil._pre(SharedPreferences this.prefs);

  ///预初始化，防止在使用get时，prefs还未完成初始化
  static Future<SharedPreferencesUtil> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = SharedPreferencesUtil._pre(prefs);
    }
    return _instance!!;
  }

  static SharedPreferencesUtil getInstance() {
    _instance ??= SharedPreferencesUtil._();
    return _instance!!;
  }

  void init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  Future<bool>?setStringList(String key, List<String> value) {
    return prefs?.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return prefs?.getStringList(key);
  }

  Object? get(String key) {
    return prefs?.get(key);
  }
}
