import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:bulby/components/common/molecules/header.dart' show Header;

/// レイアウト: 基本
class BaseLayout extends HookWidget {
  const BaseLayout({
    super.key,
    required this.i18n,
    required this.color,
    required this.child,
    required this.title,
    required this.isBackGround,
    this.onTap,
    this.badgeNumForListener,
    this.onClickRightMenu,
    this.onWillPop,
    this.rightButton,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// コンテンツ
  final Widget child;

  /// タイトル
  final String title;

  /// バッジの数
  final ValueNotifier<int>? badgeNumForListener;

  /// 背景あり
  final bool isBackGround;

  /// 外部を押した
  final void Function()? onTap;

  /// 右のメニューをクリックした
  final void Function()? onClickRightMenu;

  /// 戻る時のアクション
  final Future<bool> Function()? onWillPop;

  /// 右上のメニューに表示
  final Widget? rightButton;

  @override
  Widget build(BuildContext context) {
    final backGroundBody = Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/backGroundIcons.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: color.base.content,
        appBar: Header(
          i18n: i18n,
          color: color,
          title: title,
          badgeNumForListener: badgeNumForListener,
          onClickRightMenu: onClickRightMenu,
          rightButton: rightButton,
        ),
        body: GestureDetector(
          onTap: onTap,
          child: isBackGround ? backGroundBody : child,
        ),
      ),
    );
  }
}
