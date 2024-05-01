# Flutter Clean Code Architecture Example

This Flutter project is a demonstration of Clean Code Architecture principles using the BLoC pattern
for state management. It aims to provide a structured and scalable architecture for building
maintainable and testable Flutter applications.

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

## Getting Started

1. Clone this repository to your local machine.
2. Ensure Flutter SDK is installed and configured properly.
3. Run `flutter pub get` to install dependencies.
4. Use an IDE like Android Studio or VSCode to open the project.
5. Connect a device or use an emulator to run the application.

## Usage

- Explore the codebase to understand the implementation of Clean Code Architecture.
- Modify and extend the project to build your own Flutter applications following the same
  architecture principles.

## Contributing

Contributions are welcome! Feel free to submit issues, feature requests, or pull requests to help
improve this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
