# Smart Ahwa Manager 🧉☕

A professional Flutter application designed for Cairo's traditional coffee shop (Ahwa) owners to streamline operations, manage customer orders, and generate business insights.

## 📱 Features

- **Order Management**: Add orders with customer names, drink types (shai, Turkish coffee, hibiscus tea), and special instructions
- **Real-time Dashboard**: View pending orders and mark them as completed
- **Business Analytics**: Generate daily sales reports and track top-selling drinks
- **Intuitive UI**: Clean, modern interface optimized for busy coffee shop environments

## 🏗️ Architecture & Design Principles

This application demonstrates professional software engineering practices through the implementation of **SOLID principles** and **core Object-Oriented Programming concepts**.

### SOLID Principles Implementation

#### 1. Single Responsibility Principle (SRP)
Each class has one clear responsibility:
- **`DrinkService`**: Manages drink catalog and pricing
- **`OrderRepository`**: Handles order data persistence
- **`ReportService`**: Generates business analytics and reports
- **`ValidationService`**: Centralizes input validation logic

#### 2. Open/Closed Principle (OCP)
The system is open for extension but closed for modification:
- **`DrinkWidget`** abstract class allows new drink types without modifying existing code
- New drink categories can be added by extending the base widget class
- Report generation can be extended with new metrics without changing core logic

#### 3. Liskov Substitution Principle (LSP)
All subclasses can replace their parent classes seamlessly:
- Any `DrinkWidget` subclass can be used interchangeably
- Repository implementations are fully substitutable
- State management follows consistent contracts

#### 4. Interface Segregation Principle (ISP)
Clients depend only on methods they use:
- **`OrderRepository`** interface contains only order-related operations
- **`ReportService`** focuses solely on analytics functionality
- **`DrinkService`** provides only drink catalog operations

#### 5. Dependency Inversion Principle (DIP)
High-level modules depend on abstractions:
- **`ManagementCubit`** depends on `OrderRepository` and `ReportService` abstractions
- Constructor injection enables easy testing and implementation swapping
- Business logic is decoupled from concrete implementations

### Core OOP Concepts

#### Inheritance
- **`DrinkWidget`** hierarchy with specialized implementations for different drink types
- **`OrderModel`** and **`Drink`** models extend `Equatable` for value comparison
- State management uses inheritance for type-safe state handling

#### Polymorphism
- Different drink widgets provide specialized UIs while sharing the same interface
- Factory pattern selects appropriate widget based on drink type
- Repository implementations can be swapped without affecting business logic

#### Encapsulation
- Private fields in services and view models protect internal state
- Immutable data models ensure data integrity
- Service implementations hide complex internal logic

#### Abstraction
- Abstract interfaces define clear contracts between modules
- Business logic is abstracted from UI and data persistence concerns
- State management provides clean abstractions for UI updates

## 🏛️ Modular Architecture

The application follows a clean, modular architecture that promotes maintainability and scalability:

```
lib/
├── models/           # Data structures and business entities
├── services/         # Business logic and data access
├── view_models/      # State management (BLoC pattern)
├── views/           # UI screens and components
└── utils/           # Utility functions and helpers
```

### Benefits of This Architecture

1. **Maintainability**: Changes in one module don't affect others
2. **Testability**: Each component can be unit tested in isolation
3. **Reusability**: Services and widgets are reusable across the application
4. **Scalability**: New features integrate seamlessly without modifying existing code
5. **Team Collaboration**: Clear boundaries enable parallel development

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio or VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/smartahwa.git
cd smartahwa
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```


## 🔧 Technical Stack

- **Framework**: Flutter 3.0+
- **State Management**: BLoC (Business Logic Component)
- **Architecture**: Clean Architecture with SOLID principles
- **Data Models**: Equatable for value comparison
- **UI**: Material Design with custom widgets


