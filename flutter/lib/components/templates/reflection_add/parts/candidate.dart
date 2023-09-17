import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart'
    show HookWidget, useEffect, useState;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/components/templates/reflection_add/parts/button_candidate.dart'
    show ButtonCandidate;
import 'package:gamer_reflection/components/templates/reflection_add/domain/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

/// 振り返りがない場合
Widget candidatesNone(
  AppLocalizations i18n,
  UseColor color,
  bool isNotAdd,
) {
  final text = isNotAdd
      ? i18n.reflectionAddPageCandidateFirstText
      : i18n.reflectionAddPageCandidateNoList;

  return Column(
    children: [
      SpacerHeight.xm,
      Center(
        child: TextAnnotation(
          color: color,
          text: text,
          size: "M",
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}

Widget view(
  AppLocalizations i18n,
  UseColor color,
  List<DomainReflectionAddReflection> reflections,
  bool isNotAdd,
  Function(String text) onPressCandidate,
) {
  final Column candidateTitles = Column(
    children: [
      for (int i = 0; i < reflections.length; i++) ...{
        Bar(
          color: color.button.taskListBorder,
        ),
        ButtonCandidate(
          color: color,
          text: reflections[i].text,
          isThin: i % 2 == 0,
          onPressed: () => onPressCandidate(reflections[i].text),
        ),
      },
      Bar(
        color: color.button.taskListBorder,
      )
    ],
  );

  final candidates = reflections.isEmpty
      ? candidatesNone(
          i18n,
          color,
          isNotAdd,
        )
      : candidateTitles;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      candidates,
    ],
  );
}

/// 振り返り名候補一覧
class ReflectionAddCandidate extends HookWidget {
  const ReflectionAddCandidate({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflections,
    required this.onPressCandidate,
    required this.candidatesForListener,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;
  final List<DomainReflectionAddReflection> reflections;
  final Function(String text) onPressCandidate;
  final ValueNotifier<List<DomainReflectionAddReflection>>
      candidatesForListener;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<DomainReflectionAddReflection>> candidates =
        useState<List<DomainReflectionAddReflection>>([]);

    final bool isNotAdd = reflections.isEmpty;

    /// 外部で候補一覧が更新されたら実行
    void updateCandidates() {
      candidates.value = candidatesForListener.value;
    }

    /// NOTE:
    /// TextFormFieldの入力時に候補一覧を更新すると、
    /// TextFormFieldもリレンダリングされフォーカスが外れてしまう。
    /// 候補だけをレンダリングさせたいのでListenerでイベント発火している。
    useEffect(() {
      candidatesForListener.addListener(updateCandidates);
      return;
    }, [candidatesForListener]);

    useEffect(() {
      // 候補一覧を更新する
      candidates.value = reflections
          .map(
            (d) => DomainReflectionAddReflection(
              text: d.text,
              count: d.count,
            ),
          )
          .toList();
      return;
    }, []);

    return view(
      i18n,
      color,
      candidates.value,
      isNotAdd,
      onPressCandidate,
    );
  }
}
