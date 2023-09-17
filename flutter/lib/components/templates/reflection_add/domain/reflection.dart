import 'package:gamer_reflection/domain/site/reflection.dart'
    show DomainReflectionText, DomainReflectionCount;

/// ドメイン: 振り返り追加 振り返り
class DomainReflectionAddReflection
    implements DomainReflectionText, DomainReflectionCount {
  const DomainReflectionAddReflection({
    required this.text,
    required this.count,
  });

  /// 振り返り内容
  @override
  final String text;

  /// 回数
  @override
  final int count;
}
