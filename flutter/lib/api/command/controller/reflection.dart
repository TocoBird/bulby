import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/storage/rdb/repository/command/reflection.dart'
    show IRepositoryReflectionCommand;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

/// Request: 振り返り
class RequestReflection {
  final IRepositoryReflectionCommand rReflection =
      GetIt.I<IRepositoryReflectionCommand>();

  /// 更新
  Future<void> updateReflection(
    int id,
    String title,
    String detail,
    ReflectionType reflectionType,
  ) async {
    final Database db = GetIt.I<DBConnection>().db;
    await rReflection.updateReflectionById(
      db,
      id,
      title,
      detail,
      reflectionType,
    );
  }

  /// 削除
  Future<void> deleteReflection(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    await rReflection.deleteReflectionById(db, id);
  }
}
