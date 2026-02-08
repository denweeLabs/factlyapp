part of 'available_backgrounds_cubit.dart';

@freezed
abstract class AvailableBackgroundsState with _$AvailableBackgroundsState {
  const AvailableBackgroundsState._();
  const factory AvailableBackgroundsState.empty() = _Initial;
  const factory AvailableBackgroundsState.loading() = _Loading;
  const factory AvailableBackgroundsState.success(List<AvailableBackground> backgrounds) = _Success;
  const factory AvailableBackgroundsState.failure(BackgroundFailure data) = _Failure;

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  List<AvailableBackground> get backgrounds =>
      maybeWhen(success: (backgrounds) => backgrounds, orElse: () => []);

  Option<BackgroundFailure> get failure =>
      optionOf(maybeWhen(failure: (failure) => failure, orElse: () => null));
}
