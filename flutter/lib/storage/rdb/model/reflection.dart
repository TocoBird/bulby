import 'package:intl/intl.dart' show DateFormat;

const String tableNameReflection = "reflection";

/// Model: 振り返り
class ModelReflection {
  ModelReflection({
    this.id,
    required this.reflectionGroupId,
    required this.reflectionType,
    required this.text,
    required this.detail,
    required this.count,
    required this.createdAt,
    required this.updatedAt,
  });

  /// ID
  final int? id;

  /// GROUP_ID
  final int reflectionGroupId;

  /// 振り返りの種類 1: Good, 2: Bad
  final int reflectionType;

  /// 振り返り内容
  final String text;

  /// 振り返りの対策内容
  final String detail;

  /// 回数
  final int count;

  /// 追加日
  final DateTime createdAt;

  /// 更新日
  final DateTime updatedAt;

  Map<String, Object> toMap() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formattedC = formatter.format(createdAt);
    final String formattedU = formatter.format(updatedAt);
    return {
      'reflection_group_id': reflectionGroupId,
      'reflection_type': reflectionType,
      'text': text,
      'detail': detail,
      'count': count,
      'created_at': formattedC,
      'updated_at': formattedU,
    };
  }

  Map<String, Object> toMapReflectionGroupId() {
    return {
      'reflection_group_id': reflectionGroupId,
    };
  }

  Map<String, Object> toMapReflectionType() {
    return {
      'reflection_type': reflectionType,
    };
  }

  Map<String, Object> toMapText() {
    return {
      'text': text,
    };
  }

  Map<String, Object> toMapDetail() {
    return {
      'detail': detail,
    };
  }

  Map<String, Object> toMapCount() {
    return {
      'count': count,
    };
  }

  Map<String, Object> toMapUpdatedAt() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formatted = formatter.format(updatedAt);
    return {
      'updated_at': formatted,
    };
  }
}
