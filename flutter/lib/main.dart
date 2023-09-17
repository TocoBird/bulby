import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:gamer_reflection/components/root/app.dart' show App;
import 'package:gamer_reflection/injector.dart' show configureDependencies;
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;

/// デバイスの対応の向きを設定
void setDeviceOrientation() {
  /// 向き指定 縦固定
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

/// アプリ実行
void main() {
  /// injector
  configureDependencies();

  /// デバイスの対応の向きを設定
  setDeviceOrientation();

  /// 起動
  runApp(const App());
}
