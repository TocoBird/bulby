import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/components/templates/reflection_history/domain/reflection_history.dart'
    show DomainReflectionHistory;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_history.dart'
    show IRepositoryReflectionHisotryQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;

/// データ取得: 振り返り履歴詳細ページ
class FetchReflectionHistoryPage {
  final IRepositoryReflectionHisotryQuery rReflectionHistory =
      GetIt.I<IRepositoryReflectionHisotryQuery>();

  /// 取得: 振り返り履歴一覧
  Future<List<DomainReflectionHistory>> fetchReflectionHistory(
      int historyGroupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rReflectionHistory.getReflectionHistoryByGroupId(
      db,
      historyGroupId,
    );
  }
}
