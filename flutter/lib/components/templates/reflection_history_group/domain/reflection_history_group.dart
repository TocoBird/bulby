import 'package:gamer_reflection/domain/site/reflection_history_group.dart'
    show DomainReflectionHistoryGroupId, DomainReflectionHistoryGroupDate;

/// ドメイン: 振り返り履歴グループ 履歴グループ
class DomainReflectionHistoryGroup
    implements
        DomainReflectionHistoryGroupId,
        DomainReflectionHistoryGroupDate {
  const DomainReflectionHistoryGroup({
    required this.id,
    required this.date,
  });

  /// 振り返り内容
  @override
  final int id;

  /// 日付
  @override
  final DateTime date;
}
