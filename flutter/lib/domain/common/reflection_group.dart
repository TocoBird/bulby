import 'package:bulby/domain/site/reflection_group.dart'
    show DomainReflectionGroupId, DomainReflectionGroupName;

/// ドメイン: 共通 振り返りグループ
class DomainReflectionGroup
    implements DomainReflectionGroupId, DomainReflectionGroupName {
  const DomainReflectionGroup({
    required this.id,
    required this.name,
  });

  /// ID
  @override
  final int id;

  /// 振り返りグループ名
  @override
  final String name;
}
