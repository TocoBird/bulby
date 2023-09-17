import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;

/// ドメイン: 振り返りID
class DomainReflectionId {
  const DomainReflectionId({required this.id});
  final int id;
}

/// ドメイン: 振り返りグループID
class DomainReflectionGroupId {
  const DomainReflectionGroupId({required this.groupId});
  final int groupId;
}

/// ドメイン: 振り返り内容
class DomainReflectionText {
  const DomainReflectionText({required this.text});
  final String text;
}

/// ドメイン: 振り返りの対策内容
class DomainReflectionDetail {
  const DomainReflectionDetail({required this.detail});
  final String detail;
}

/// ドメイン: 振り返り回数
class DomainReflectionCount {
  const DomainReflectionCount({required this.count});
  final int count;
}

/// ドメイン: 振り返り優先度
class DomainReflectionPriority {
  const DomainReflectionPriority({required this.priority});
  final int priority;
}

/// ドメイン: 振り返り優先度の色
class DomainReflectionTagColor {
  const DomainReflectionTagColor({required this.tagColor});
  final TagTextColor tagColor;
}

/// ドメイン: 振り返りの種類
class DomainReflectionType {
  const DomainReflectionType({required this.reflectionType});
  final ReflectionType reflectionType;
}

/// ドメイン: 振り返り日付
class DomainReflectionUpdatedAt {
  const DomainReflectionUpdatedAt({required this.updatedAt});
  final DateTime updatedAt;
}
