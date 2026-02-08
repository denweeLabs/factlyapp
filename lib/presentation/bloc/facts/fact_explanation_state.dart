part of 'fact_explanation_cubit.dart';

@freezed
abstract class FactExplanationState with _$FactExplanationState {
  const FactExplanationState._();

  const factory FactExplanationState({
    @Default(false) bool checkingFactExplanation,
    @Default(false) bool factExplanationChecked,
    @Default(false) bool loadingFactExplanation,
    @Default(false) bool factExplanationLoaded,
    @Default(None()) Option<FactExplanation> explanation,
    @Default(None()) Option<FactsFailure> failure,
  }) = _FactExplanationState;

  factory FactExplanationState.initial() => const FactExplanationState();

  bool get hasExplanation => explanation.isSome() || factExplanationLoaded;
}
