import 'package:get_it/get_it.dart' show GetIt;
import 'package:injectable/injectable.dart' show InjectableInit;
import 'package:gamer_reflection/injector.config.dart' show init;

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => init(getIt);
