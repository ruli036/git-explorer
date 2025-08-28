## Architecture
This project follows Clean Architecture with a modular structure:

- `presentation/` - UI, widgets, and state management using GetX
- `domain/` - Business logic, use cases, and entities
- `data/` - Data sources (local/remote) and repository implementations
- `app/` - App-level setup like routes, bindings, and entry point
- `core/` - Global utilities, constants, themes, and shared services


## Getting Started

```bash
flutter pub get
flutter run