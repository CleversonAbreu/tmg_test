# tmg_test

A sample Flutter application that consumes the public GitHub API to list users, following Clean Architecture principles.
Uses Dio for HTTP requests, GetIt for dependency injection, Bloc/Cubit for state management, and unit testing.

## Features

Features
* Paginated GitHub users fetching (since and per_page parameters)
* Clean Architecture with separate layers (domain, data, presentation)
* Dependency injection with GetIt
* State management with Flutter Bloc (Cubit)
* Unit tests for use cases and cubit
* Basic error and state handling (loading, success, error)

## How to Run
Clone the repository:
* git clone https://github.com/CleversonAbreu/tmg_test.git
* cd tmg_test

## Install dependencies:
flutter pub get

## Run the app:
flutter run

## Testing
flutter test

## Technologies & Packages
* Flutter
* Dio — HTTP client
* GetIt — Dependency injection
* Flutter Bloc — State management
* Equatable — Value equality for objects
* bloc_test — Testing Bloc/Cubit
* mocktail — Mocking for tests

## Clean Architecture Overview
* Domain: Pure business logic, entities, and use cases.
* Data: Data sources, repository implementations, models.
* Presentation: UI and state management with Cubit/Bloc.