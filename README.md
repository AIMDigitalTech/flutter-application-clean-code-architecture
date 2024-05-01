# Flutter Clean Code Architecture Example by AIM Digital Technologies

This project demonstrates a robust implementation of clean architecture principles in a Flutter application.
By separating concerns into layers (data, domain, and presentation), we achieve a well-organized, maintainable, and testable codebase.
Bloc is utilized for effective state management, ensuring a clear separation of data and UI logic.

## Key Features

- Clean architecture for enhanced organization and maintainability
- Bloc for streamlined state management
- Modular structure for feature-based development
- Emphasis on testability for improved code quality

## Overview

This project follows the guidelines of Clean Code Architecture, separating concerns into layers to
achieve a high level of abstraction and decoupling between different modules. The main layers of
this architecture include:

- **Presentation Layer:** Contains UI components such as screens, widgets, and their corresponding
  BLoCs for managing state.
- **Domain Layer:** Defines business logic and use cases independent of any UI framework.
- **Data Layer:** Handles data operations such as fetching from remote sources, local database, or
  shared preferences.

## Features

- **BLoC for State Management:** Utilizes the Bloc library for managing application state.
- **Dependency Injection:** Implements service locator pattern using `get_it` for efficient
  dependency management.
- **Localization:** Supports multiple languages using the `intl` package for localization.
- **Networking:** Uses Dio for making HTTP requests and `simple_connection_checker` for network
  connectivity checks.
- **Local Data Storage:** Utilizes SQLite database via `drift` and `sqlite3_flutter_libs` for local
  data storage.
- **Firebase Integration:** Integrates Firebase services including Firebase Messaging, Crashlytics,
  and Analytics.
- **UI/UX:** Implements themes, navigation, and font customization using packages like `get`
  and `google_fonts`.

## Prerequisites

- Flutter SDK version `>=3.3.4 <4.0.0`.
- Android SDK or Xcode for building and running the application.

## Dependencies

This project leverages a variety of essential Flutter packages to deliver a rich user experience:

- **flutter_bloc:** Manages application state through BLoC patterns.
- **equatable:** Simplifies value object comparisons.
- **get_it:** Offers a dependency injection solution.
- **get:** Provides navigation and theming functionalities.
- **dartz:** Enables functional programming constructs in Dart.
- **shared_preferences:** Facilitates local storage of data.
- **flutter_localizations:** Supports app localization.
- **intl:** Aids in internationalization efforts.
- **dio:** Handles efficient networking operations.
- **simple_connection_checker:** Verifies internet connectivity.
- **path:** Assists with file path handling.
- **path_provider:** Provides access to application storage directories.
- **drift:** A powerful ORM (Object-Relational Mapper) for database interactions (optional).
- **sqlite3_flutter_libs:** Allows for SQLite database usage with Flutter (optional).
- **firebase_messaging:** Enables push notifications (optional).
- **firebase_crashlytics:** Integrates crash reporting (optional).
- **firebase_analytics:** Provides app usage analytics (optional).
- **firebase_core:** Core Firebase functionalities (optional).
- **flutter_local_notifications:** Local notification management (optional).
- **flutter_flavorizr:** Facilitates flavor management for different environments (optional).
- **permission_handler:** Requests and manages user permissions (optional).
- **google_fonts:** Integrates Google Fonts for a wider font selection (optional).

## Getting Started

1. Clone this repository to your local machine.
2. Ensure Flutter SDK is installed and configured properly.
3. Run `flutter pub get` to install dependencies.
5. Use an IDE like Android Studio or VSCode to open the project.
6. Connect a device or use an emulator to run the application.
7. Run 'flutter run' to run the application.

## Usage

- Explore the codebase to understand the implementation of Clean Code Architecture.
- Modify and extend the project to build your own Flutter applications following the same
  architecture principles.

## Contributing

Contributions are welcome! Feel free to submit issues, feature requests, or pull requests to help
improve this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## AIM Digital Technologies


