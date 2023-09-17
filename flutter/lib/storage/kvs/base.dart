import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

/// KVS: 文字
class StrageKVS {
  String key = "";
  StrageKVS(this.key);

  /// 取得する
  Future<String?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  /// 保存する
  Future<void> save(String v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, v);
  }
}

/// KVS: 数字
class StrageKVSNumber {
  String key = "";
  StrageKVSNumber(this.key);

  /// 取得する
  Future<int?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  /// 保存する
  Future<void> save(int v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, v);
  }
}
