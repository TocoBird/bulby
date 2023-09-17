import 'package:gamer_reflection/domain/site/reflection.dart'
    show DomainReflectionText, DomainReflectionCount, DomainReflectionType;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

/// ドメイン: 追加している振り返り
class DomainReflectionAdded
    implements
        DomainReflectionText,
        DomainReflectionCount,
        DomainReflectionType {
  const DomainReflectionAdded({
    required this.text,
    required this.count,
    required this.reflectionType,
  });

  /// 振り返り内容
  @override
  final String text;

  /// 回数
  @override
  final int count;

  /// 振り返りの種類
  @override
  final ReflectionType reflectionType;
}
