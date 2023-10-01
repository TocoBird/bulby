import 'package:flutter/material.dart'
    show Widget, BuildContext, Colors, Text, TextStyle, ValueNotifier;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart'
    show HookWidget, useEffect, useState;
import 'package:bulby/components/common/atoms/button/done.dart' show ButtonDone;
import 'package:badges/badges.dart' as badges;

/// ボタン: 振り返りの完了
class ReflectionButtonDone extends HookWidget {
  const ReflectionButtonDone({
    super.key,
    required this.i18n,
    required this.color,
    required this.badgeNumForListener,
    this.onPressed,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// バッジの数
  final ValueNotifier<int>? badgeNumForListener;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> badgeNum = useState<int>(0);

    /// 外部で候補一覧が更新されたら実行
    void updateBadge() {
      badgeNum.value = badgeNumForListener!.value;
    }

    /// NOTE:
    /// バッジ番号のみをレンダリングさせたいのでListenerでイベント発火している
    /// 全体をレンダリングすると、入力欄のフォーカスが外れる
    useEffect(() {
      if (badgeNumForListener == null) return;
      badgeNum.value = badgeNumForListener!.value;
      badgeNumForListener!.addListener(updateBadge);
      return;
    }, [badgeNumForListener]);

    return badges.Badge(
      position: badges.BadgePosition.custom(
        top: -12,
        end: -2,
      ),
      badgeContent: Text(
        badgeNum.value.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      showBadge: badgeNum.value != 0,
      child: ButtonDone(
        color: color,
        text: i18n.reflectionAddPageBottomDone,
        onPressed: onPressed,
        isThin: badgeNum.value == 0,
      ),
    );
  }
}
