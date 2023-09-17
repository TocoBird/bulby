import 'package:flutter/material.dart'
    show
        TextEditingController,
        ValueNotifier,
        FocusNode,
        BuildContext,
        GlobalKey,
        FormState,
        Navigator;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect;
import 'package:gamer_reflection/components/templates/reflection_add/domain/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/components/templates/reflection_add/domain/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/components/templates/reflection_add/parts/modal/add.dart'
    show showAddModal;
import 'package:gamer_reflection/components/templates/reflection_add/parts/modal/confirm_back.dart'
    show showModalConfirmBack;
import 'package:gamer_reflection/components/common/atoms/toast/hooks.dart'
    show useToast;

class UseReturn {
  const UseReturn({
    required this.onPressedAddReflection,
    required this.onPressedAddCandidate,
    required this.onPressedReflectionDone,
    required this.onChangeTextReflection,
    required this.textReflection,
    required this.textFieldFocusNode,
    required this.onPressedRemoveText,
    required this.formKey,
    required this.candidatesForListener,
    required this.badgeNumForListener,
    required this.onWillPop,
    required this.onClickRightMenu,
  });
  final void Function(BuildContext) onPressedAddReflection;
  final void Function(String) onPressedAddCandidate;
  final void Function() onPressedRemoveText;
  final void Function(String?) onChangeTextReflection;
  final TextEditingController textReflection;
  final FocusNode textFieldFocusNode;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<int> badgeNumForListener;
  final ValueNotifier<List<DomainReflectionAddReflection>>
      candidatesForListener;
  final Future<bool> Function(BuildContext) onWillPop;
  final void Function(BuildContext) onPressedReflectionDone;
  final void Function(BuildContext) onClickRightMenu;
}

/// ロジック: 振り返り追加ページ
UseReturn useHooks(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  List<DomainReflectionAddReflection> reflections,
  List<DomainReflectionAdded> addedReflectionsFromOtherPage,
  int groupId,
  Function(BuildContext, bool, List<DomainReflectionAdded>)
      pushReflectionAddedList,
) {
  final FocusNode textFieldFocusNode = useFocusNode();
  final ValueNotifier<TextEditingController> textReflection =
      useState<TextEditingController>(TextEditingController());
  final ValueNotifier<int> badgeNumForListener =
      ValueNotifier<int>(addedReflectionsFromOtherPage.length);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isGood = true;
  // 更新後の振り返り一覧
  List<DomainReflectionAddReflection> addedReflections = [];
  // 追加した保存するための振り返り一覧
  List<DomainReflectionAdded> reflectionsForRegister = [];
  // 表示する候補の一覧
  ValueNotifier<List<DomainReflectionAddReflection>> candidatesForListener =
      ValueNotifier<List<DomainReflectionAddReflection>>([]);
  // トースト通知
  final toast = useToast(context, color);

  /// 入力欄をリセットする
  void resetInput() {
    formKey.currentState?.reset();
  }

  /// ページに保存される候補一覧を返す
  List<DomainReflectionAddReflection> getAddedReflections(String text) {
    final candidateNotExist = addedReflections.every((e) => e.text != text);

    // 重複しない場合は候補一覧に追加する
    if (candidateNotExist) {
      return [
        DomainReflectionAddReflection(
          text: text,
          count: 1,
        ),
        ...addedReflections,
      ];
    }

    // 重複する場合はcountを加算する
    return addedReflections
        .map(
          (c) => DomainReflectionAddReflection(
            count: text == c.text ? c.count + 1 : c.count,
            text: c.text,
          ),
        )
        .toList();
  }

  /// 振り返りの追加
  void addReflection() {
    final String text = textReflection.value.text;

    // 登録するための振り返り一覧
    final noExist = reflectionsForRegister.every((e) => e.text != text);
    if (noExist) {
      reflectionsForRegister.add(DomainReflectionAdded(
        count: 1,
        text: text,
        reflectionType: isGood ? ReflectionType.good : ReflectionType.bad,
      ));
    } else {
      reflectionsForRegister = reflectionsForRegister
          .map(
            (r) => DomainReflectionAdded(
              count: r.text == text ? r.count + 1 : r.count,
              text: r.text,
              reflectionType: r.reflectionType,
            ),
          )
          .toList();
    }

    // 候補の更新
    addedReflections = getAddedReflections(text);

    // 表示する候補の更新
    candidatesForListener.value = addedReflections;
  }

  /// モーダルで追加を押した
  void onPressedAddModal(BuildContext c, bool candidateExist) {
    // 振り返りの追加
    addReflection();

    // 入力欄をリセットする
    resetInput();

    // 振り返り種類の初期値を更新
    isGood = true;

    // バッジの更新
    badgeNumForListener.value = reflectionsForRegister.length;

    // モーダルを消す
    Navigator.pop(c);
  }

  /// 振り返りの追加を押した
  Future<void> onPressedAddReflection(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    int reflectionCount = 1;
    final text = textReflection.value.text;
    final candidateExist = !addedReflections.every((e) => e.text != text);
    // すでに追加したことがある振り返り
    if (candidateExist) {
      final DomainReflectionAddReflection domain = addedReflections.firstWhere(
        (c) => c.text == text,
      );
      reflectionCount = domain.count;
    }

    // 一度に追加できる上限は30件まで。
    // 重複する場合は加算可能
    if (!candidateExist && reflectionsForRegister.length >= 30) {
      toast.showAlert(i18n.reflectionAddPageAddValidate, 2500);
      return;
    }

    // 追加するモーダルを表示する
    showAddModal(
      i18n,
      color,
      context,
      text,
      candidateExist,
      reflectionCount,
      (BuildContext c) => onPressedAddModal(c, candidateExist),
      () => isGood = true,
      () => isGood = false,
    );
  }

  /// 振り返りの入力文字削除を押した
  void onPressedRemoveText() {
    // 入力欄をリセットする
    resetInput();

    // 候補の更新
    candidatesForListener.value = addedReflections;
  }

  /// 振り返りの完了を押した
  void onPressedReflectionDone(BuildContext c) {
    if (reflectionsForRegister.isEmpty) {
      toast.showAlert(i18n.reflectionAddPageDoneAlert, 2500);
      return;
    }

    // 追加した振り返りページへ移動
    pushReflectionAddedList(c, true, reflectionsForRegister);
  }

  /// 右上の一覧メニューを押した
  void onClickRightMenu(BuildContext c) {
    // 追加した振り返りページへ移動
    pushReflectionAddedList(c, false, reflectionsForRegister);
  }

  /// 候補から振り返りの追加を押した
  void onPressedAddCandidate(String text) {
    textReflection.value.text = text;
    textFieldFocusNode.unfocus();

    // 候補の更新
    candidatesForListener.value = addedReflections;
  }

  /// 振り返りの入力中のイベント
  void onChangeTextReflection(String? t) {
    if (t == null) return;

    // 候補一覧を含まれてる文字がある内容だけに更新
    candidatesForListener.value =
        addedReflections.where((c) => c.text.contains(t)).toList();
  }

  /// 戻るのをチェックする
  Future<bool> onWillPop(BuildContext context) {
    // 何も追加してなければチェックしない
    final bool reflectionNotExist = reflectionsForRegister.isEmpty;
    if (reflectionNotExist) return Future.value(true);

    // 追加するモーダルを表示する
    showModalConfirmBack(i18n, color, context);

    // 戻らない
    return Future.value(false);
  }

  useEffect(() {
    if (reflections.isEmpty) return;

    // 候補一覧を更新する
    addedReflections = reflections
        .map((d) => DomainReflectionAddReflection(
              text: d.text,
              count: d.count,
            ))
        .toList();

    // 追加した振り返り一覧
    reflectionsForRegister = addedReflectionsFromOtherPage;

    return;
  }, [reflections]);

  return UseReturn(
    badgeNumForListener: badgeNumForListener,
    onPressedAddReflection: onPressedAddReflection,
    onPressedAddCandidate: onPressedAddCandidate,
    onPressedReflectionDone: onPressedReflectionDone,
    onPressedRemoveText: onPressedRemoveText,
    onChangeTextReflection: onChangeTextReflection,
    textReflection: textReflection.value,
    textFieldFocusNode: textFieldFocusNode,
    formKey: formKey,
    candidatesForListener: candidatesForListener,
    onWillPop: onWillPop,
    onClickRightMenu: onClickRightMenu,
  );
}
