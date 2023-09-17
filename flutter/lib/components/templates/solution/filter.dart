import 'package:bulby/components/templates/solution/domain/reflection.dart'
    show DomainSolutionReflection;
import 'package:bulby/modules/type/tag_text_color.dart' show TagTextColor;
import 'package:bulby/components/common/molecules/button_period_filter/type.dart'
    show Period;
import 'package:bulby/modules/type/reflection.dart' show ReflectionType;
import 'package:bulby/modules/date/date.dart' show getMonthAgo, getDayAgo;

/// 優先度からTagの色を返す
TagTextColor getTagColor(int priority) {
  switch (priority) {
    case 1:
      return TagTextColor.red;
    case 2:
      return TagTextColor.purple;
    default:
      return TagTextColor.blue;
  }
}

/// 一覧からcountを取得し、重複なしで大きい順に返す
List<int> getHighPriorityIds(List<DomainSolutionReflection> domains) {
  /// カウントのみの配列
  final Iterable<int> counts = domains.map((e) => e.count);

  /// 重複を消す
  final List<int> countDistincts = counts.toSet().toList();

  countDistincts.sort(((a, b) => b.compareTo(a)));

  return countDistincts;
}

/// 期間でフィルターする
/// month: month以内の月でフィルターする
List<DomainSolutionReflection> filteredMonth(
  int month,
  List<DomainSolutionReflection> rs,
) {
  /// 現在からmonth前の日付を返す
  final DateTime monthAgo = getMonthAgo(DateTime.now(), month);
  return rs.where((e) => e.updatedAt.isAfter(monthAgo)).toList();
}

/// 期間でフィルターする
/// day: day以内でフィルターする
List<DomainSolutionReflection> filteredDay(
  int day,
  List<DomainSolutionReflection> rs,
) {
  /// 現在からmonth前の日付を返す
  final DateTime dayAgo = getDayAgo(DateTime.now(), day);
  return rs.where((e) => e.updatedAt.isAfter(dayAgo)).toList();
}

/// 3位まで優先度を返す
int getPriority(List<int> counts, int count) {
  final int length = counts.length;
  if (length > 0 && counts[0] == count) return 1;
  if (length > 1 && counts[1] == count) return 2;
  return 3;
}

/// 期間でフィルターされた一覧を取得
List<DomainSolutionReflection> getFilteredPeriod(
  Period p,
  List<DomainSolutionReflection> domains,
) {
  switch (p) {
    case Period.leftButton:
      return domains;
    case Period.centerButton:
      return filteredMonth(3, domains);
    case Period.rightButton:
      return filteredDay(7, domains);
    default:
      return [];
  }
}

/// 振り返り種類でフィルターされた一覧を取得
List<DomainSolutionReflection> getFilteredReflectionType(
  List<DomainSolutionReflection> domains,
  ReflectionType reflectionType,
) {
  return domains.where((r) => r.reflectionType == reflectionType).toList();
}
