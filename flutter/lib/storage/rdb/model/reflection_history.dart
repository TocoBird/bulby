const String tableNameReflectionHistory = "reflection_history";

/// Model: 振り返りの履歴
class ModelReflectionHistory {
  ModelReflectionHistory({
    this.id,
    required this.reflectionHistoryGroupId,
    required this.reflectionType,
    required this.text,
    required this.count,
  });

  /// ID
  final int? id;

  /// 振り返りの履歴のグループID
  final int reflectionHistoryGroupId;

  /// 振り返りの種類 1: Good, 2: Bad 未使用だが保存はしておく
  final int reflectionType;

  /// 振り返り内容
  final String text;

  /// 回数
  final int count;

  Map<String, Object> toMap() {
    return {
      'reflection_history_group_id': reflectionHistoryGroupId,
      'reflection_type': reflectionType,
      'text': text,
      'count': count,
    };
  }
}
