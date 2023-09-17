import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/storage/rdb/model/game.dart' show ModelGame;
import 'package:bulby/components/templates/reflection/domain/game.dart'
    show DomainReflectionGame;
import 'package:bulby/modules/const/rank/rank_system.dart'
    show constantRankSystems;

/// Adapter Domain: Reflection
class AdapterReflection {
  /// ゲーミフィケーション
  DomainReflectionGame domainGame(ModelGame model, AppLocalizations i18n) {
    final currentRank = constantRankSystems(i18n).firstWhere((e) {
      // 次のランクがなく経験値がprevExp以上
      if (e.nextExp == null && e.prevExp <= model.exp) return true;
      // prevExp以上かつnextExpより小さい
      return e.prevExp <= model.exp && model.exp < e.nextExp!;
    });

    /// ドメインに変換
    return DomainReflectionGame(
      exp: model.exp,
      nextExp: currentRank.nextExp,
      prevExp: currentRank.prevExp,
      rank: currentRank.rank,
      rankImage: currentRank.rankImg,
    );
  }
}
