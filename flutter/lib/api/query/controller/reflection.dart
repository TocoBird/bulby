import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/components/templates/reflection/domain/game.dart'
    show DomainReflectionGame;
import 'package:bulby/storage/rdb/repository/query/reflection_group.dart'
    show IRepositoryReflectionGroupQuery;
import 'package:bulby/storage/rdb/repository/query/reflection.dart'
    show IRepositoryReflectionQuery;
import 'package:bulby/storage/rdb/repository/query/game.dart'
    show IRepositoryGameQuery;
import 'package:bulby/storage/rdb/driver/sqlite.dart' show DBConnection;
import 'package:bulby/api/query/adapter/reflection.dart' show AdapterReflection;

/// データ取得: 振り返りページ
class FetchReflectionPage {
  final IRepositoryReflectionGroupQuery rReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupQuery>();
  final IRepositoryGameQuery rGame = GetIt.I<IRepositoryGameQuery>();
  final IRepositoryReflectionQuery rReflection =
      GetIt.I<IRepositoryReflectionQuery>();

  /// 取得: 振り返りグループ一覧
  Future<List<DomainReflectionGroup>> fetchReflectionGroups() async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rReflectionGroup.getReflectionGroups(db);
  }

  /// 取得: ゲーミフィケーション情報
  Future<DomainReflectionGame> fetchGame(AppLocalizations i18n) async {
    final Database db = GetIt.I<DBConnection>().db;
    final model = await rGame.getGame(db);
    return AdapterReflection().domainGame(model, i18n);
  }

  /// 取得: 振り返り総数
  Future<int> fetchReflectionCount(int groupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rReflection.getReflectionCount(db, groupId);
  }
}
