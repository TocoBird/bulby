import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/templates/todo/domain/todo.dart'
    show DomainTodo;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_group.dart'
    show IRepositoryReflectionGroupQuery;
import 'package:gamer_reflection/storage/rdb/repository/query/todo.dart'
    show IRepositoryTodoQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;

/// データ取得: タスク一覧ページ
class FetchTodoPage {
  final IRepositoryReflectionGroupQuery rReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupQuery>();
  final IRepositoryTodoQuery rTodo = GetIt.I<IRepositoryTodoQuery>();

  /// 取得: 振り返りグループ一覧
  Future<List<DomainReflectionGroup>> fetchReflectionGroups() async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rReflectionGroup.getReflectionGroups(db);
  }

  /// 取得: やること一覧
  Future<List<DomainTodo>> fetchTodos(int groupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rTodo.getTodos(db, groupId);
  }
}
