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
    required T Function() ru,
  }) {
    switch (preferences.language.languageCode) {
      case 'en': return en();
      case 'ru': return ru();
      default: return en();
    }
  }
}
