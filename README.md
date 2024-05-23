# Flutter Reminder App

A simple reminder application built with Flutter, using provider for state management and flutter_local_notifications for scheduling notifications.

## Table of Contents

- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [Running the App](#running-the-app)
- [Project Structure](#project-structure)

## Getting Started

These instructions will help you set up and run the project on your local machine.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- A code editor like [Visual Studio Code](https://code.visualstudio.com/).

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/Nisham-N-K/flutter_reminder_app.git
    
    https://github.com/Nisham-N-K/Flutter-Application-.git
    
    cd flutter_reminder_app
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Configure Flutter for web:**

    ```bash
    flutter config --enable-web
    ```

## Dependencies

This project uses the following dependencies:

- `flutter`: The core framework.
- `cupertino_icons`: For iOS styled icons.
- `flutter_local_notifications`: For scheduling local notifications.
- `provider`: For state management.
- `timezone`: For handling time zones in notifications.

Make sure these dependencies are added in your `pubspec.yaml`:

```yaml
name: flutter_reminder_app
description: A new Flutter project.
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.4.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  flutter_local_notifications: ^9.5.3
  flutter_lints: ^3.0.0
  provider: ^6.1.2
  timezone: ^0.8.0

flutter:
  uses-material-design: true
flutter_reminder_app/
├── android/
├── assets/
├── ios/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── reminder_model.dart
│   ├── pages/
│   │   └── home_page.dart
│   └── widgets/
│       └── reminder_form.dart
├── pubspec.yaml
└── README.md

