part of 'user_preferences_cubit.dart';

@freezed
abstract class UserPreferencesState with _$UserPreferencesState {
  const UserPreferencesState._();
  const factory UserPreferencesState({
    required UserPreferences preferences,
    @Default(None()) Option<PreferencesFailure> failure,
  }) = _UserPreferencesState;

  factory UserPreferencesState.initial() {
    return UserPreferencesState(
      preferences: UserPreferences.initial(),
    );
  }

  T whenLanguage<T>({
    required T Function() en,
    T Function()? ru,
    T Function()? it,
    T Function()? fr,
    T Function()? de,
    T Function()? zh,
  }) {
    switch (preferences.language.languageCode) {
      case 'en': return en();
      case 'ru': return ru?.call() ?? en();
      case 'it': return it?.call() ?? en();
      case 'fr': return fr?.call() ?? en();
      case 'de': return de?.call() ?? en();
      case 'zh': return zh?.call() ?? en();
      default: return en();
    }
  }
}
