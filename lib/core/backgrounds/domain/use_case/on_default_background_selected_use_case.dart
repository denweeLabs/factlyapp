import 'package:denwee/core/backgrounds/domain/repo/backgrounds_repo.dart';
import 'package:denwee/core/ui/bloc/backgrounds/active_background_cubit.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class OnDefaultBackgroundSelectedUseCase {
  final BackgroundsRepo _backgroundsRepo;
  final ActiveBackgroundCubit _activeBackgroundCubit;

  const OnDefaultBackgroundSelectedUseCase(
    this._backgroundsRepo,
    this._activeBackgroundCubit,
  );

  void execute() {
    _backgroundsRepo.deleteBackgroundAssetLocal();
    _activeBackgroundCubit.clearState();
  }
}