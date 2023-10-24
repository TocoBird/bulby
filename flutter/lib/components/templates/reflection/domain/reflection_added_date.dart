import 'package:bulby/domain/site/reflection_added_date.dart'
    show DomainReflectionAddedDateCount, DomainReflectionAddedDateDate;

/// ドメイン: 振り返りページ 振り返りした日
class DomainReflectionAddedDate
    implements DomainReflectionAddedDateCount, DomainReflectionAddedDateDate {
  const DomainReflectionAddedDate({
    required this.count,
    required this.date,
  });

  /// 経験値
  @override
  final int count;

  /// 現在のランク
  @override
  final DateTime date;
}
