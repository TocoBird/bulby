import 'package:intl/intl.dart' show DateFormat;

const String tableNameTodo = "todo";

/// Model: やること
class ModelTodo {
  ModelTodo({
    this.id,
    required this.indexNum,
    required this.reflectionId,
    required this.reflectionGroupId,
    required this.todoType,
    required this.createdAt,
  });

  /// ID
  final int? id;

  /// 番号
  final int indexNum;

  /// 対象の振り返りID
  final int reflectionId;

  /// GROUP_ID
  final int reflectionGroupId;

  /// 振り返りの種類 1: 試合, 2: 練習
  final int todoType;

  /// 追加日
  final DateTime createdAt;

  Map<String, Object> toMap() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formatted = formatter.format(createdAt);
    return {
      'index_num': indexNum,
      'reflection_id': reflectionId,
      'reflection_group_id': reflectionGroupId,
      'todo_type': todoType,
      'created_at': formatted,
    };
  }
}
