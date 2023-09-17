import 'package:intl/intl.dart' show DateFormat;

const String tableNameGame = "game";

/// Model: ゲーミフィケーション
class ModelGame {
  ModelGame({
    this.id,
    required this.exp,
    required this.updatedAt,
  });

  /// ID
  final int? id;

  /// 経験値
  late final int exp;

  /// 更新日
  final DateTime updatedAt;

  Map<String, Object> toMap() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formatted = formatter.format(updatedAt);
    return {
      'exp': exp,
      'updated_at': formatted,
    };
  }
}
