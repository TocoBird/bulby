import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/components/templates/reflection_add/domain/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection.dart'
    show IRepositoryReflectionQuery;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_group.dart'
    show IRepositoryReflectionGroupQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/api/query/adapter/reflection_add.dart'
    show AdapterDomainReflectionAddPage;

/// データ取得: 振り返り追加ページ
class FetchReflectionAddPage {
  final IRepositoryReflectionQuery rReflection =
      GetIt.I<IRepositoryReflectionQuery>();
  final IRepositoryReflectionGroupQuery rReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupQuery>();

  /// 取得: 振り返り一覧
  Future<List<DomainReflectionAddReflection>> fetchReflections(
      int groupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await rReflection.getReflections(db, groupId);
    return AdapterDomainReflectionAddPage().domainReflections(models);
  }

  /// 取得: 振り返りグループ一覧
  Future<List<DomainReflectionGroup>> fetchReflectionGroups() async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rReflectionGroup.getReflectionGroups(db);
  }
}
