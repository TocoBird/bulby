import 'package:flutter/material.dart'
    show
        AppBar,
        Widget,
        BuildContext,
        PreferredSizeWidget,
        Size,
        BackButton,
        Colors;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// ヘッダー
class Header extends HookWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.i18n,
    required this.color,
    required this.title,
    this.rightButton,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// ヘッダータイトル
  final String title;

  /// 右上のメニューに表示
  final Widget? rightButton;

  /// 高さのサイズ
  @override
  Size get preferredSize => const Size.fromHeight(ConstantSizeUI.l7);

  @override
  AppBar build(BuildContext context) {
    /// 右上のアイコンを追加
    List<Widget> getActions() {
      // 右上に何も表示しない
      if (rightButton == null) return [];
      // 右上に表示する
      return [rightButton!];
    }

    return AppBar(
      title: BasicText(
        color: color,
        text: title,
        size: "M",
      ),
      leading: BackButton(
        color: color.base.icon, // <-- SEE HERE
      ),
      backgroundColor: color.base.header,
      actions: getActions(),
    );
  }
}
