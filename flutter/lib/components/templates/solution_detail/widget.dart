import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:bulby/components/templates/solution_detail/domain/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:bulby/components/templates/solution_detail/hooks.dart'
    show useHooks;
import 'package:bulby/modules/type/data_fetch.dart' show DataFetchState;
import 'package:bulby/components/templates/solution_detail/view.dart' show view;

/// ページ: 解決案詳細
class TemplateSolutionDetail extends HookWidget {
  const TemplateSolutionDetail({
    super.key,
    required this.i18n,
    required this.color,
    required this.dataFetchState,
    required this.reflectionId,
    required this.reflectionGroupId,
    required this.todoCount,
    required this.reflection,
    required this.updateReflection,
    required this.todoExistDB,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// データ取得状態
  final DataFetchState dataFetchState;

  /// 振り返りタスクID
  final int reflectionId;

  /// 振り返りグループID
  final int reflectionGroupId;

  /// やること総数
  final int todoCount;

  /// 振り返り一覧
  final DomainSolutionDetailReflection? reflection;

  /// 更新
  final Future<void> Function() updateReflection;

  /// やることに追加済みか
  final bool? todoExistDB;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(
      i18n,
      color,
      context,
      reflectionId,
      reflectionGroupId,
      todoCount,
      reflection,
      updateReflection,
      todoExistDB,
    );

    return view(
      i18n,
      color,
      context,
      h.todoExist,
      h.titleFocusNode,
      h.detailFocusNode,
      reflection,
      h.isEditMode,
      h.toggleEditMode,
      h.titleController,
      h.detailController,
      h.formKey,
      h.groupValue,
      h.onPressedEditDone,
      h.onPressedDone,
      h.onPressedCancel,
      h.onChangedGood,
      h.onChangedBad,
      h.onPressedToggleTodo,
    );
  }
}
