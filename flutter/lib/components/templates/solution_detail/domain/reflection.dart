import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:gamer_reflection/domain/site/reflection.dart'
    show
        DomainReflectionId,
        DomainReflectionGroupId,
        DomainReflectionText,
        DomainReflectionDetail,
        DomainReflectionCount,
        DomainReflectionType,
        DomainReflectionPriority,
        DomainReflectionTagColor,
        DomainReflectionUpdatedAt;

/// ドメイン: タスク詳細ページ 振り返り
class DomainSolutionDetailReflection
    implements
        DomainReflectionId,
        DomainReflectionGroupId,
        DomainReflectionText,
        DomainReflectionDetail,
        DomainReflectionCount,
        DomainReflectionType,
        DomainReflectionPriority,
        DomainReflectionTagColor,
        DomainReflectionUpdatedAt {
  const DomainSolutionDetailReflection({
    required this.id,
    required this.groupId,
    required this.text,
    required this.detail,
    required this.count,
    required this.reflectionType,
    required this.priority,
    required this.tagColor,
    required this.updatedAt,
  });

  /// ID
  @override
  final int id;

  /// 振り返りグループID
  @override
  final int groupId;

  /// 振り返り内容
  @override
  final String text;

  /// 振り返りの対策内容
  @override
  final String detail;

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
