<h1 align="center">
  <br>
  <a href="https://www.denwee.com">
    <img src="./res/app_icon_preview.webp" alt="Denwee: Daily Trivia" width="200">
  </a>
  <br>
  Denwee: Daily Trivia
  <br>
</h1>

<h4 align="center">Discover short, easy-to-understand, memorable facts every day!</h4>

<p align="center">
  <a href="https://apps.apple.com/ua/app/denwee/id6756196669">
    <img src="./res/download_on_app_store.svg" alt="Download on the App Store" height="45" width="120">
  </a>
  <a href="https://play.google.com/store/apps/details?id=app.denwee.factlyapp">
    <img src="./res/get_on_google_play.svg" alt="Get it on Google Play" height="45" width="132">
  </a>
</p>


<p align="center">
  <a href="https://www.denwee.com">
    <img src="./res/mockup.webp" alt="Mockup">
  </a>
</p>


> Denwee is an open-source mobile application built with Flutter. It delivers personalized daily facts based on user-selected interests and supports push notifications, localization, and a modular, scalable architecture inspired by SOLID principles.






## 🎥 Onboarding

Click to watch full app onboarding (30s):

[![Onboarding Preview](res/onboarding_preview.gif)](https://www.denwee.com/media/onboarding.mp4)






## 🎨 Features

- Daily facts delivery with [Supabase](https://supabase.com) and [ChatGPT Batch API](https://platform.openai.com/docs/guides/batch)
- Push notifications using [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging)
- Synced user accounts via [Supabase Auth](https://supabase.com/docs/guides/auth)
- Analytics and crash reporting with [Firebase Analytics](https://firebase.google.com/products/analytics) and [Crashlytics](https://firebase.google.com/products/crashlytics)
- Multi-language support with [Easy Localization](https://pub.dev/packages/easy_localization)






## 🛠 Tech Stack

| Layer      | Technologies | Description |
|----------- |--------------|-------------|
| **Frontend (Open Source)** | Flutter, Dart, Firebase Cloud Messaging, Localizations | Client app, responsible for UI, notifications, localization, and user interactions |
| **Backend (Closed Source)** | Supabase, PostgreSQL, Supabase Edge Functions, ChatGPT API (Batch), Cron/Scheduled Jobs | Handles authentication, facts generation, data storage, multi-device token management, and notification scheduling |
| **Infrastructure** | Supabase (Database, Auth, API)<br>Firebase (Push Notifications, Analytics, Crashlytics) | Manages user accounts, data, push notifications, analytics, and crash reporting |






## 📦 Primary Packages

| Package | Purpose |
|---------|---------|
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | State management |
| [get_it](https://pub.dev/packages/get_it) | Dependency injection |
| [app_links](https://pub.dev/packages/app_links) | Deep links |
| [drift](https://pub.dev/packages/drift) | Local database |
| [dio](https://pub.dev/packages/dio) | Network requests |
| [easy_localization](https://pub.dev/packages/easy_localization) | Multi-language support |
| [animate_do](https://pub.dev/packages/animate_do) | Animations |






## 🧩 Architecture

> This section describes the architectural structure of the application and its internal dependency model.
> The design follows principles inspired by Clean Architecture, with emphasis on separation of concerns, modularity, and long-term maintainability.


### Folder Structure

The project is organized using a feature-based structure with explicit separation between domain, data, and presentation layers.
The following diagram illustrates the base structure of the project:

```mermaid
flowchart TB

subgraph Presentation[" "]
  direction TB
  page
  bloc
  widget
  shared
end

subgraph Feature[" "]
  direction TB

  data --> model_m[model]
  data --> repo_m[repo]
  data --> source_m[source]

  domain --> entity_d[entity]
  domain --> repo_d[repo]
  domain --> source_d[source]
  domain --> use_case_d[use_case]
end

lib --> core
core --> feature
feature --> Feature

lib --> presentation
presentation --> Presentation
```

> The `presentation/` folder is kept outside of the `core/` directory to enforce strict separation between application logic and UI components.
> Below is what each layer is responsible for using the **Profile** feature as an example for typical files ⬇️


### Domain Layer

| Folder      | Responsibility | Typical Files |
|-------------|----------------|---------------|
| `entity/`   | Business models | `profile.dart`<br>`profile_failure.dart` |
| `use_case/` | Business operations | `get_profile_use_case.dart` |
| `repo/`     | Repository contracts | `profile_repo.dart` |
| `source/`   | Data source contracts | `profile_local_source.dart`<br>`profile_remote_source.dart` |

> The domain layer contains pure business logic and application rules for implementing feature behavior in the application.
> It defines core use cases and entities and remains independent of external frameworks and data sources.


### Data Layer

| Folder     | Responsibility | Typical Files |
|------------|----------------|---------------|
| `model/`   | Data transfer objects (DTOs) | `profile_dto.dart`<br>`profile_response_dto.dart` |
| `repo/`    | Repository implementations | `profile_repo_impl.dart` |
| `source/`  | Local / Remote data source implementations | `profile_local_source_impl.dart`<br>`profile_remote_source_impl.dart` |

> The data layer is used for retrieving, storing, and transforming external data for application features.
> It implements domain contracts and performs DTO-to-entity mapping.


### Presentation Layer

- `pages/` contains all application screens
- `bloc/` contains Cubits and Blocs for state management
- `widget/` contains reusable UI components
- `shared/` contains routing, theming, constants, utilities, etc...

> The presentation layer is separated from core feature modules as a deliberate design choice.
> This structure reflects a personal preference for improved screen discoverability and centralized UI infrastructure.


### Dependency Injection

The application uses annotation-based dependency injection with `injectable` and `get_it` to connect layers and enable controlled execution flows.
Dependencies are registered automatically through code generation.

Example objects injection:
``` dart
@LazySingleton()
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;

  ProfileCubit(this._getProfileUseCase) : super(ProfileState.initial());
}

@LazySingleton()
class GetProfileUseCase {
  final ProfileRepo _profileRepo;

  const GetProfileUseCase(this._profileRepo);
}
```

Example resolution hierarchy:

```text
ProfilePage
  → ProfileCubit
    → GetProfileUseCase
      → ProfileRepository
        → ProfileRemoteSource / ProfileLocalSource
          → API
```






## 🖌️ Assets

- **Static icons** from [Iconsax](https://iconsax.io)  
- **Animated emojis** from [Noto Animated Emojis](https://googlefonts.github.io/noto-emoji-animation/) — licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode)  
- **Fonts:** [Quicksand](https://fonts.google.com/specimen/Quicksand) (Primary), [Manrope](https://fonts.google.com/specimen/Manrope) (Secondary)






## 🚀 How To Run

To run this application, you'll need [Flutter](https://flutter.dev) of version `3.35` or higher:

```bash
# Get all packages
flutter pub get

# Generate localization files
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/presentation/shared/localization"

# Generate localization keys
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/presentation/shared/localization" -o "locale_keys.g.dart" -f keys

# Build runner
dart run build_runner build --delete-conflicting-outputs

# Run dev environment
flutter run --flavor dev -t lib/main_dev.dart

# Run prod environment
flutter run --flavor prod -t lib/main_prod.dart
```






## 🤝 How To Contribute

Denwee projects are crafted by a solo enthusiastic developer across Mobile, Web, and Backend technologies. Your contributions, no matter how big or small, are always welcome! Here’s how you can help:

* **Open PR's** – fix bugs, add features, or improve existing code.
* **Submit Issues** – report bugs, request features, or suggest improvements.






## 🌐 You May Also Like

Explore the **Denwee App landing page**, built with Flutter Web. This simple landing page is also open-source 🔥 [Check it out](https://github.com/denweeLabs/factlyapp-landing)






## 🏆 Credits

Some design elements and animations were inspired by [Reflectly App](https://reflectlyapp.com), adapted and implemented originally for Denwee. Definitely check out their awesome product!






## ❤️ Support

For any questions or support, please reach out to support@denwee.com 🫶

<a href="https://buymeacoffee.com/denweelabs" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" height="41" width="174"></a>






## 📃 License

[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](https://opensource.org/licenses/MIT)
