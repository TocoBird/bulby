import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/storage/rdb/repository/command/reflection_group.dart'
    show IRepositoryReflectionGroupCommand;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;

/// Request: 振り返りグループ
class RequestReflectionGroup {
  final IRepositoryReflectionGroupCommand rReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupCommand>();

  /// 新規追加
  Future<int> addReflectionGroup(String name) async {
    final Database db = GetIt.I<DBConnection>().db;
    final id = await rReflectionGroup.insertReflectionGroup(db, name);
    return id;
  }

  /// 更新
  Future<void> updateReflectionGroup(
    int id,
    String name,
  ) async {
    final Database db = GetIt.I<DBConnection>().db;
    await rReflectionGroup.updateReflectionGroupNameById(db, id, name);
  }

  /// 削除
  Future<void> deleteReflection(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    await rReflectionGroup.deleteReflectionGroupById(db, id);
  }
}
