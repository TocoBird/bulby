import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/reflection_history.dart'
    show tableNameReflectionHistory;
import 'package:gamer_reflection/components/templates/reflection_history/domain/reflection_history.dart'
    show DomainReflectionHistory;

/// Interface: RepositoryReflectionHistoryQuery
abstract class IRepositoryReflectionHisotryQuery {
  Future<List<DomainReflectionHistory>> getReflectionHistoryByGroupId(
    Database db,
    int reflectionHistoryGroupId,
  );
}

/// Repository: 振り返り履歴
@Injectable(as: IRepositoryReflectionHisotryQuery)
class RepositoryReflectionHistoryQuery
    extends IRepositoryReflectionHisotryQuery {
  /// 取得: グループ中の振り返り履歴一覧
  @override
  Future<List<DomainReflectionHistory>> getReflectionHistoryByGroupId(
    Database db,
    int reflectionHistoryGroupId,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflectionHistory,
      columns: ['*'],
      where: '"reflection_history_group_id" = ?',
      whereArgs: [reflectionHistoryGroupId],
      orderBy: 'count DESC',
      limit: 30,
    );

    return List.generate(
      res.length,
      (i) {
        return DomainReflectionHistory(
          id: res[i]['id'] as int,
          text: res[i]['text'] as String,
          count: res[i]['count'] as int,
        );
      },
    );
  }
}
