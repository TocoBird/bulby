import 'package:intl/intl.dart' show DateFormat;

const String tableNameReflectionAddedDate = "reflection_added_date";

/// Model: 振り返りした日
class ModelReflectionAddedDate {
  ModelReflectionAddedDate({
    required this.date,
    required this.count,
  });

  /// 振り返り内容
  final DateTime date;

  /// 回数
  final int count;

  Map<String, Object> toMap() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(date);
    return {
      'date': formattedDate,
      'count': count,
    };
  }
}
