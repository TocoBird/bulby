import 'package:bulby/components/templates/reflection_add/domain/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:bulby/storage/rdb/model/reflection.dart' show ModelReflection;

/// Adapter Domain: ReflectionAdd
class AdapterDomainReflectionAddPage {
  /// 振り返り一覧取得
  List<DomainReflectionAddReflection> domainReflections(
      List<ModelReflection> models) {
    /// ドメインに変換
    final domain = models.map(
      (m) {
        return DomainReflectionAddReflection(
          text: m.text,
          count: m.count,
        );
      },
    );

    return domain.toList();
  }
}
