part of 'app_constants.dart';

/// Centralized configuration values for the application
class _ConfigConstants {
  _ConfigConstants();


  // ---------------------------------------------------------------------------
  // NOTIFICATIONS
  // ---------------------------------------------------------------------------

  /// Set of default daily notification times (picked randomly)
  /// Values are “HH:mm”
  final defaultNotificationTimes = [
    hourAndMin(19, 30),
    hourAndMin(20, 00),
    hourAndMin(20, 30),
    hourAndMin(21, 00),
    hourAndMin(21, 30),
    hourAndMin(22, 00),
  ];

  /// Notifications are enabled by default
  final defaultNotificationsEnabled = true;

  /// Time picker step (in minutes)
  /// Backend requires a minimum of 30 min
  final notificationTimeSelectionStepMin = 30;


  // ---------------------------------------------------------------------------
  // USER ACCOUNT / PROFILE / AUTHENTICATION
  // ---------------------------------------------------------------------------

  /// Username constraints
  final usernameMinLength = 2;
  final usernameMaxLength = 25;

  /// Request authentication every 7 app entries
  final promptAuthenticationEachEnter = 7;

  /// Password constraints
  final passwordMinLength = 8;
  final passwordMaxLength = 128;

  /// Access token refresh prior to expiry for this duration
  final tokenRefreshPriorDuration = const Duration(minutes: 1);


  // ---------------------------------------------------------------------------
  // UX / UI BEHAVIOR
  // ---------------------------------------------------------------------------

  /// Enable haptic feedback by default
  final defaultHapticsEnabled = true;

  /// App assumes device is online each time it opened
  final assumeDeviceHasNetworkOnStart = true;

  /// Theme mode used by default
  final defaultThemeMode = ThemeMode.system;

  /// Default theme coloration preset
  final defaultThemeColorationId = UniqueId.fromValue(4);

  /// Available coloration presets for theme customization
  final themeColorations = <ThemeColoration>[
    ThemeColoration(
      id: UniqueId.fromValue(1),
      primary: const Color(0xFF5F4BAE),
      secondary: const Color(0xFF8570D1),
    ),
    ThemeColoration(
      id: UniqueId.fromValue(2),
      primary: const Color(0xFFF76276),
      secondary: const Color(0xFFFF8F87),
    ),
    ThemeColoration(
      id: UniqueId.fromValue(3),
      primary: const Color(0xFF6CC6BA),
      secondary: const Color(0xFF267280),
    ),
    ThemeColoration(
      id: UniqueId.fromValue(4),
      primary: const Color(0xFF447CF5),
      secondary: const Color(0xFF83A9F1),
    ),
    ThemeColoration(
      id: UniqueId.fromValue(5),
      primary: const Color(0xFFFBA17A),
      secondary: const Color(0xFFFD9697),
    ),
    ThemeColoration(
      id: UniqueId.fromValue(6),
      primary: const Color(0xFF08A5CC),
      secondary: const Color(0xFF03CBA6),
    ),
    ThemeColoration(
      id: UniqueId.fromValue(7),
      primary: const Color(0xFFF4AAC4),
      secondary: const Color(0xFFEE8AB8),
    ),
    ThemeColoration(
      id: UniqueId.fromValue(8),
      primary: const Color(0xFF635CE5),
      secondary: const Color(0xFF667ED2),
    ),
    ThemeColoration(
      id: UniqueId.fromValue(9),
      primary: const Color(0xFFFA6B6B),
      secondary: const Color(0xFFFF9980),
    ),
  ];


  // ---------------------------------------------------------------------------
  // ARCHIVE & ADS
  // ---------------------------------------------------------------------------

  /// Number of items loaded at once ('per page') in "Archive” page
  final myArchivePageSize = 15;

  /// Trigger archive ad every N times a user archives a fact
  final showArchiveAdOnCountOf = 2;

  /// Chance (percentage) to actually show the ad when triggered
  final showArchiveAdProbabilityPercent = 85;

  /// In-app “fact explanation” cost in stars (cost locked on backend)
  final factExplanationStarsCost = 1;


  // ---------------------------------------------------------------------------
  // LOCALIZATION / LANGUAGES
  // ---------------------------------------------------------------------------

  /// Supported localizations
  final supportedLocales = const [
    Locale('en'),
    Locale('it'),
    Locale('de'),
    Locale('fr'),
    Locale('ru'),
    Locale('zh'),
  ];

  /// Timeago message mappings for each localization
  final supportedLocalesLookupMessages = <Locale, LookupMessages>{
    Locale('en'): timeago.EnMessages(),
    Locale('it'): timeago.ItMessages(),
    Locale('de'): timeago.DeMessages(),
    Locale('fr'): timeago.FrMessages(),
    Locale('ru'): timeago.RuMessages(),
    Locale('zh'): timeago.ZhCnMessages(),
  };

  /// Languages displayed in the "Language" page
  final languages = <AppLanguage>[
    AppLanguage(locale: Locale('en'), nativeName: 'English', englishName: 'English'),
    AppLanguage(locale: Locale('it'), nativeName: 'Italiano', englishName: 'Italian'),
    AppLanguage(locale: Locale('de'), nativeName: 'Deutsch', englishName: 'German'),
    AppLanguage(locale: Locale('fr'), nativeName: 'Français', englishName: 'French'),
    AppLanguage(locale: Locale('ru'), nativeName: 'Русский', englishName: 'Russian'),
    AppLanguage(locale: Locale('zh'), nativeName: '简体中文', englishName: 'Chinese (Simplified)'),
  ];

  /// Fallback if a locale’s translations cannot be loaded
  final fallbackLocale = const Locale('en');

  /// Path to translation assets
  final localesPath = 'assets/translations';


  // ---------------------------------------------------------------------------
  // LINKS / SUPPORT
  // ---------------------------------------------------------------------------

  /// Open-source repository
  final aboutAppUrl = 'https://github.com/denweeLabs/factlyapp';

  /// Landing page
  final denweeLandingUrl = 'https://denwee.com';

  /// Privacy & Terms
  final privacyPolicyUrl = 'https://denwee.com/privacy';
  final termsOfUseUrl = 'https://denwee.com/terms';

  /// Support contact
  final supportEmail = 'support@denwee.com';
  final supportEmailSubject = 'Support Request :)';
}
