import 'package:intl/intl.dart' show DateFormat;

const String tableNameReflectionHistoryGroup = "reflection_history_group";

/// Model: 振り返りの履歴のグループ
class ModelReflectionHistoryGroup {
  ModelReflectionHistoryGroup({
    this.id,
    required this.reflectionGroupId,
    required this.date,
  });

  /// ID
  final int? id;

  /// GROUP_ID
  final int reflectionGroupId;

  /// 追加日
  final DateTime date;

  Map<String, Object> toMap() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formatted = formatter.format(date);
    return {
      'reflection_group_id': reflectionGroupId,
      'date': formatted,
    };
  }
}
