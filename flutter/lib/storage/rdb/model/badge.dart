import 'package:intl/intl.dart' show DateFormat;

const String tableNameTodo = "badge";

/// Model: バッジ
class ModelBadge {
  ModelBadge({
    this.id,
    required this.createdAt,
  });

  /// ID
  final int? id;

  /// 追加日
  final DateTime createdAt;

  Map<String, Object> toMap() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formatted = formatter.format(createdAt);
    return {
      'id': id ?? 0,
      'created_at': formatted,
    };
  }
}
