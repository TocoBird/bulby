import 'package:sqflite/sqflite.dart' show Database;

/// DB: マイグレーション
class TableMigration {
  Future<void> migrate(Database db, int version) async {}
}
