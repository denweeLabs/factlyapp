part of 'active_background_cubit.dart';

@freezed
abstract class ActiveBackgroundState with _$ActiveBackgroundState {
  const ActiveBackgroundState._();

  const factory ActiveBackgroundState.defaultBackground() = _Default;
  const factory ActiveBackgroundState.applying(UniqueId id) = _Applying;
  const factory ActiveBackgroundState.failure(BackgroundFailure data) = _Failure;
  const factory ActiveBackgroundState.applied({
    required bool isPurchasedViaStars,
    required ResolvedBackgroundAsset asset,
  }) = _Applied;

  bool get isApplying => maybeWhen(applying: (_) => true, orElse: () => false);

  Option<UniqueId> get applyingId =>
      optionOf(maybeWhen(applying: (id) => id, orElse: () => null));

  bool get isApplied =>
      maybeWhen(applied: (_, __) => true, orElse: () => false);
      
  Option<BackgroundFailure> get failure =>
      optionOf(maybeWhen(failure: (data) => data, orElse: () => null));

  Option<ResolvedBackgroundAsset> get appliedBackground =>
      optionOf(maybeWhen(applied: (_, data) => data, orElse: () => null));

  UniqueId get selectedId => maybeWhen(
    applied: (_, data) => data.background.id,
    orElse: () => AppConstants.config.defaultBackgroundId,
  );
}
