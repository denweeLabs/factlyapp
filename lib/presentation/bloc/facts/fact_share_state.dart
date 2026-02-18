part of 'fact_share_cubit.dart';

enum FactCaptureArea { page, fact }

@freezed
abstract class FactShareState with _$FactShareState {
  const FactShareState._();

  const factory FactShareState.initial() = _Initial;
  const factory FactShareState.preparing(
    FactCaptureArea area,
    FactShareSupportedTarget target,
  ) = _Preparing;
  const factory FactShareState.capturing(
    FactCaptureArea area,
    FactShareSupportedTarget target,
  ) = _Capturing;
  const factory FactShareState.success(File file) = _Success;
  const factory FactShareState.failure(CommonApiFailure error) = _Failure;

  Option<FactCaptureArea> get capturingArea => optionOf(
    maybeWhen(
      preparing: (area, _) => area,
      capturing: (area, _) => area,
      orElse: () => null,
    ),
  );

  bool get isBusy => maybeWhen(
    preparing: (_, __) => true,
    capturing: (_, __) => true,
    orElse: () => false,
  );

  Option<FactShareSupportedTarget> get sharingTarget => optionOf(
    maybeWhen(
      preparing: (_, target) => target,
      capturing: (_, target) => target,
      orElse: () => null,
    ),
  );

  Option<CommonApiFailure> get failure =>
      optionOf(maybeWhen(failure: (failure) => failure, orElse: () => null));

  Option<File> get outputFile =>
      optionOf(maybeWhen(success: (file) => file, orElse: () => null));
}
