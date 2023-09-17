import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/components/templates/solution/domain/reflection.dart'
    show DomainSolutionReflection;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection.dart'
    show IRepositoryReflectionQuery;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_group.dart'
    show IRepositoryReflectionGroupQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/api/query/adapter/solution.dart'
    show AdapterDomainSolutionPage;

/// データ取得: タスク一覧ページ
class FetchSolutionPage {
  final IRepositoryReflectionQuery rReflection =
      GetIt.I<IRepositoryReflectionQuery>();
  final IRepositoryReflectionGroupQuery rReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupQuery>();

  /// 取得: 振り返り一覧
  Future<List<DomainSolutionReflection>> fetchReflections(int groupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await rReflection.getReflections(db, groupId);
    return AdapterDomainSolutionPage().domainReflections(models);
  }

  /// 取得: 振り返りグループ一覧
  Future<List<DomainReflectionGroup>> fetchReflectionGroups() async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rReflectionGroup.getReflectionGroups(db);
  }
}
