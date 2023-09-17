import 'package:bulby/components/templates/solution_detail/domain/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:bulby/modules/type/reflection.dart' show ReflectionType;
import 'package:bulby/storage/rdb/model/reflection.dart' show ModelReflection;
import 'package:bulby/modules/type/tag_text_color.dart' show TagTextColor;

/// Adapter Domain: Reflection
class AdapterDomainSolutionDetailPage {
  /// 振り返り詳細取得
  DomainSolutionDetailReflection domainReflection(ModelReflection model) {
    final reflectionType =
        model.reflectionType == 1 ? ReflectionType.good : ReflectionType.bad;
    return DomainSolutionDetailReflection(
      id: model.id ?? 0,
      groupId: model.reflectionGroupId,
      text: model.text,
      detail: model.detail,
      count: model.count,
      reflectionType: reflectionType,
      priority: 0,
      tagColor: TagTextColor.gray,
      updatedAt: model.updatedAt,
    );
  }
}
