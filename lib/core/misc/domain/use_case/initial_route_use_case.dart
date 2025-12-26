import 'package:denwee/core/misc/data/storage/common_storage.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class InitialRouteUseCase {
  final CommonStorage _commonStorage;

  const InitialRouteUseCase(this._commonStorage);

  String retrieve() {
    return _commonStorage.isOnboardingState() ? Routes.welcome : Routes.home;
  }
}
