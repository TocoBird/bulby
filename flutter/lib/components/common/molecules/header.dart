import 'package:flutter/material.dart'
    show
        AppBar,
        Widget,
        Text,
        TextStyle,
        Colors,
        BuildContext,
        ValueNotifier,
        PreferredSizeWidget,
        Size,
        IconButton,
        Icon,
        Icons;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:badges/badges.dart' as badges;
import 'package:flutter_hooks/flutter_hooks.dart'
    show HookWidget, useEffect, useState;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// ヘッダー
class Header extends HookWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.i18n,
    required this.color,
    required this.title,
    this.onClickRightMenu,
    this.badgeNumForListener,
    this.rightButton,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// ヘッダータイトル
  final String title;

  /// バッジの数
  final ValueNotifier<int>? badgeNumForListener;

  /// 右のハンバーガーメニューをクリックした
  final void Function()? onClickRightMenu;

  /// 右上のメニューに表示
  final Widget? rightButton;

  /// 高さのサイズ
  @override
  Size get preferredSize => const Size.fromHeight(ConstantSizeUI.l7);

  @override
  AppBar build(BuildContext context) {
    final ValueNotifier<int> badgeNum = useState<int>(0);

    /// 外部で候補一覧が更新されたら実行
    void updateBadge() {
      badgeNum.value = badgeNumForListener!.value;
    }

    /// NOTE:
    /// バッジ番号のみをレンダリングさせたいのでListenerでイベント発火している。
    useEffect(() {
      if (badgeNumForListener == null) return;
      badgeNum.value = badgeNumForListener!.value;
      badgeNumForListener!.addListener(updateBadge);
      return;
    }, [badgeNumForListener]);

    /// 右上のアイコンを追加
    List<Widget> getActions() {
      // 右上に何も表示しない
      if (rightButton == null) return [];
      // 右上に表示する
      return [rightButton!];
    }

    /// 右上のアイコンを追加
    /// todo: リファクタ
    List<Widget> getActionsBadge() {
      // 数字なしなら非表示
      if (badgeNum.value == 0) return [];

      //　数字付き
      return [
        badges.Badge(
          position: badges.BadgePosition.custom(top: 0, end: 2),
          badgeContent: Text(
            badgeNum.value.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: IconButton(
            icon: const Icon(Icons.dehaze_sharp),
            onPressed: onClickRightMenu,
          ),
        ),
      ];
    }

    return AppBar(
      title: BasicText(
        color: color,
        text: title,
        size: "M",
      ),
      backgroundColor: color.base.header,
      actions: onClickRightMenu == null ? getActions() : getActionsBadge(),
    );
  }
}
