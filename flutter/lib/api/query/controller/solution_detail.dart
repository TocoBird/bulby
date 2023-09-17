import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:bulby/components/templates/solution_detail/domain/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:bulby/storage/rdb/repository/query/reflection.dart'
    show IRepositoryReflectionQuery;
import 'package:bulby/storage/rdb/repository/query/todo.dart'
    show IRepositoryTodoQuery;
import 'package:bulby/storage/rdb/driver/sqlite.dart' show DBConnection;
import 'package:bulby/api/query/adapter/solution_detail.dart'
    show AdapterDomainSolutionDetailPage;

/// データ取得: 振り返り詳細ページ
class FetchSolutionDetailPage {
  final IRepositoryReflectionQuery rReflection =
      GetIt.I<IRepositoryReflectionQuery>();
  final IRepositoryTodoQuery rTodo = GetIt.I<IRepositoryTodoQuery>();

  /// 取得: 振り返り詳細
  Future<DomainSolutionDetailReflection> fetchReflectionById(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    final model = await rReflection.getReflectionById(db, id);
    return AdapterDomainSolutionDetailPage().domainReflection(model);
  }

  /// 取得: やることが追加されているか
  Future<bool> fetchTodoExistById(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rTodo.todoExist(db, id);
  }

  /// 取得: やること総数
  Future<int> fetchTodoCount(int groupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await rTodo.getTodoCount(db, groupId);
  }
}
