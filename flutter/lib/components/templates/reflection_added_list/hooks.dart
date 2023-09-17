import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:bulby/components/templates/reflection_add/domain/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:bulby/api/command/controller/reflection_add_list.dart'
    show RequestReflectionAddList;
import 'package:bulby/components/common/atoms/toast/hooks.dart' show useToast;

class UseReturn {
  const UseReturn({
    required this.reflectionsOnPage,
    required this.onClickRemove,
    required this.onWillPop,
    required this.onPressedReflectionDone,
  });
  final List<DomainReflectionAdded> reflectionsOnPage;
  final void Function(String) onClickRemove;
  final Future<bool> Function(BuildContext) onWillPop;
  final void Function(BuildContext) onPressedReflectionDone;
}

/// ロジック: 振り返り追加ページ
UseReturn useHooks(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  List<DomainReflectionAdded> reflections,
  int groupId,
) {
  // 追加した保存するための振り返り一覧
  ValueNotifier<List<DomainReflectionAdded>> reflectionsOnPage =
      useState<List<DomainReflectionAdded>>([]);
  final toast = useToast(context, color);

  /// 削除を押した
  void onClickRemove(String text) {
    reflectionsOnPage.value =
        reflectionsOnPage.value.where((e) => e.text != text).toList();
  }

  ///　戻るときに振り返り一覧も送る
  Future<bool> onWillPop(BuildContext context) {
    Navigator.pop(context, reflectionsOnPage.value);
    return Future.value(false);
  }

  /// 完了を押した
  void onPressedReflectionDone(BuildContext context) {
    // 経験値は固定
    const exp = 35;
    // 振り返りをDBに保存
    RequestReflectionAddList().createReflection(
      reflectionsOnPage.value,
      groupId,
      exp,
    );

    // 追加完了
    toast.showNotification(i18n.pageReflectionAddedListDoneAlert, 2500);

    // モーダルを閉じて、前のページへ戻る
    Navigator.of(context)
      ..pop()
      ..pop();
  }

  useEffect(() {
    reflectionsOnPage.value = reflections;
    return;
  }, []);

  return UseReturn(
    reflectionsOnPage: reflectionsOnPage.value,
    onWillPop: onWillPop,
    onClickRemove: onClickRemove,
    onPressedReflectionDone: onPressedReflectionDone,
  );
}
