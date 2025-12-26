import 'package:get_it/get_it.dart';
import 'package:denwee/di/di.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies(String env) =>
    $initGetIt(getIt, environment: env);
