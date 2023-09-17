import 'package:bulby/components/templates/solution/domain/reflection.dart'
    show DomainSolutionReflection;
import 'package:bulby/modules/type/reflection.dart' show ReflectionType;
import 'package:bulby/storage/rdb/model/reflection.dart' show ModelReflection;
import 'package:bulby/modules/type/tag_text_color.dart' show TagTextColor;

/// Adapter Domain: Reflection
class AdapterDomainSolutionPage {
  /// 振り返り一覧取得
  List<DomainSolutionReflection> domainReflections(
      List<ModelReflection> models) {
    /// ドメインに変換
    final domain = models.map(
      (m) {
        ReflectionType reflectionType =
            m.reflectionType == 1 ? ReflectionType.good : ReflectionType.bad;
        return DomainSolutionReflection(
          id: m.id ?? 0,
          text: m.text,
          count: m.count,
          reflectionType: reflectionType,
          priority: 1,
          tagColor: TagTextColor.gray,
          updatedAt: m.updatedAt,
        );
      },
    );

    return domain.toList();
  }
}
