import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/components/templates/reflection_history_group/domain/reflection_history_group.dart'
    show DomainReflectionHistoryGroup;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_history_group.dart'
    show IRepositoryReflectionHistoryGroupQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;

/// データ取得: 振り返り履歴グループページ
class FetchReflectionHistoryGroupPage {
  final IRepositoryReflectionHistoryGroupQuery rReflectionHistoryGroup =
      GetIt.I<IRepositoryReflectionHistoryGroupQuery>();

  /// 取得: 振り返り履歴グループ一覧
  Future<List<DomainReflectionHistoryGroup>> fetchReflectionHistoryGroups(
      int reflectionGroupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rReflectionHistoryGroup.getReflectionHistoryGroups(
      db,
      reflectionGroupId,
    );
  }
}
