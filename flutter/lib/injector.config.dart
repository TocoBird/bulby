// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'storage/rdb/repository/command/game.dart' as _i4;
import 'storage/rdb/repository/command/reflection.dart' as _i7;
import 'storage/rdb/repository/command/reflection_added_date.dart' as _i3;
import 'storage/rdb/repository/command/reflection_group.dart' as _i8;
import 'storage/rdb/repository/command/reflection_history_group.dart' as _i11;
import 'storage/rdb/repository/command/todo.dart' as _i14;
import 'storage/rdb/repository/query/game.dart' as _i5;
import 'storage/rdb/repository/query/reflection.dart' as _i13;
import 'storage/rdb/repository/query/reflection_added_date.dart' as _i6;
import 'storage/rdb/repository/query/reflection_group.dart' as _i9;
import 'storage/rdb/repository/query/reflection_history.dart' as _i10;
import 'storage/rdb/repository/query/reflection_history_group.dart' as _i12;
import 'storage/rdb/repository/query/todo.dart' as _i15;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.IReflectionAddedDateCommand>(
      () => _i3.RepositoryReflectionAddedDateCommand());
  gh.factory<_i4.IRepositoryGameCommand>(() => _i4.RepositoryGameCommand());
  gh.factory<_i5.IRepositoryGameQuery>(() => _i5.RepositoryGameQuery());
  gh.factory<_i6.IRepositoryReflectionAddedDateQuery>(
      () => _i6.RepositoryReflectionAddedDateQuery());
  gh.factory<_i7.IRepositoryReflectionCommand>(
      () => _i7.RepositoryReflectionCommand());
  gh.factory<_i8.IRepositoryReflectionGroupCommand>(
      () => _i8.RepositoryReflectionGroupCommand());
  gh.factory<_i9.IRepositoryReflectionGroupQuery>(
      () => _i9.RepositoryReflectionQuery());
  gh.factory<_i10.IRepositoryReflectionHisotryQuery>(
      () => _i10.RepositoryReflectionHistoryQuery());
  gh.factory<_i11.IRepositoryReflectionHistoryGroupCommand>(
      () => _i11.RepositoryReflectionHistoryGroupCommand());
  gh.factory<_i12.IRepositoryReflectionHistoryGroupQuery>(
      () => _i12.RepositoryReflectionHistoryGroupQuery());
  gh.factory<_i13.IRepositoryReflectionQuery>(
      () => _i13.RepositoryReflectionQuery());
  gh.factory<_i14.IRepositoryTodoCommand>(() => _i14.RepositoryTodoCommand());
  gh.factory<_i15.IRepositoryTodoQuery>(() => _i15.RepositoryTodoQuery());
  return getIt;
}
