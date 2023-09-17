import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:gamer_reflection/domain/site/reflection.dart'
    show
        DomainReflectionId,
        DomainReflectionText,
        DomainReflectionCount,
        DomainReflectionType,
        DomainReflectionPriority,
        DomainReflectionTagColor,
        DomainReflectionUpdatedAt;

/// ドメイン: タスク一覧 振り返り
class DomainSolutionReflection
    implements
        DomainReflectionId,
        DomainReflectionText,
        DomainReflectionCount,
        DomainReflectionType,
        DomainReflectionPriority,
        DomainReflectionTagColor,
        DomainReflectionUpdatedAt {
  const DomainSolutionReflection({
    required this.id,
    required this.text,
    required this.count,
    required this.reflectionType,
    required this.priority,
    required this.tagColor,
    required this.updatedAt,
  });

  /// ID
  @override
  final int id;

  /// 振り返り内容
  @override
  final String text;

  /// 回数
  @override
  final int count;

  /// 優先度
  @override
  final int priority;

  /// 優先度の色
  @override
  final TagTextColor tagColor;

  /// 振り返りの種類
  @override
  final ReflectionType reflectionType;

  /// 日付
  @override
  final DateTime updatedAt;
}
