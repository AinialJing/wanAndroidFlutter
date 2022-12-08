import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil{
    late SharedPreferences prefs;
    static late SharedPreferencesUtil _instance;

    SharedPreferencesUtil._(){
        init();
    }

    SharedPreferencesUtil._pre(SharedPreferences prefs){
      this.prefs=prefs;
    }

   ///预初始化，防止在使用get时，prefs还未完成初始化
  static Future<SharedPreferencesUtil> preInit() async{
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = SharedPreferencesUtil._pre(prefs);
    }
    return _instance;
  }

    static SharedPreferencesUtil getInstance() {
      if (_instance == null) {
        _instance = SharedPreferencesUtil._();
      }
      return _instance;
    }

    void init() async {
      if (prefs == null) {
        prefs = await SharedPreferences.getInstance();
      }
    }

    setString(String key, String value) {
      prefs.setString(key, value);
    }

    setDouble(String key, double value) {
      prefs.setDouble(key, value);
    }

    setInt(String key, int value) {
      prefs.setInt(key, value);
    }

    setBool(String key, bool value) {
      prefs.setBool(key, value);
    }

    setStringList(String key, List<String> value) {
      prefs.setStringList(key, value);
    }

    Object? get(String key) {
      return prefs.get(key);
    }
}