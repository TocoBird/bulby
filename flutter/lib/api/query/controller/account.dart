import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_group.dart'
    show IRepositoryReflectionGroupQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;

/// データ取得: アカウント設定ページ
class FetchAccountPage {
  final IRepositoryReflectionGroupQuery rReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupQuery>();

  /// 取得: 振り返りグループ一覧
  Future<List<DomainReflectionGroup>>
      fetchReflectionGroups() async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rReflectionGroup.getReflectionGroups(db);
  }
}
