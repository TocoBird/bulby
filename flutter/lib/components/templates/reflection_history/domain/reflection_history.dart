import 'package:bulby/domain/site/reflection_history.dart'
    show
        DomainReflectionHistoryId,
        DomainReflectionHistoryText,
        DomainReflectionHistoryCount;

/// ドメイン: 振り返り履歴詳細 履歴詳細
class DomainReflectionHistory
    implements
        DomainReflectionHistoryId,
        DomainReflectionHistoryText,
        DomainReflectionHistoryCount {
  const DomainReflectionHistory({
    required this.id,
    required this.text,
    required this.count,
  });

  /// 振り返り内容
  @override
  final int id;

  /// 振り返りタイトル
  @override
  final String text;

  /// 回数
  @override
  final int count;
}
