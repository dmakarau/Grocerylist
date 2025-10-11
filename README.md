# 🛒 Flutter Grocery List

A modern, elegant grocery list management application built with Flutter. This project demonstrates clean architecture, comprehensive testing, and professional development practices for mobile app development.

![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.8.1+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material Design](https://img.shields.io/badge/Material%20Design%203-757575?style=for-the-badge&logo=material-design&logoColor=white)
![License](https://img.shields.io/badge/License-Educational-green?style=for-the-badge)

## 📱 Features

- **📋 Grocery Management**: Add, view, and organize grocery items with categories
- **🎨 Modern UI**: Material Design 3 with custom dark theme and color scheme
- **📱 Responsive Design**: Optimized for various screen sizes and orientations
- **🏷️ Category System**: Organized items by categories (Vegetables, Fruits, Meat, Dairy, etc.)
- **📦 Quantity Tracking**: Track quantities for each grocery item
- **🎯 Clean Architecture**: Well-structured codebase with separation of concerns

## 🏗️ Architecture & Design

### **Project Structure**
```
lib/
├── main.dart                 # Application entry point
├── data/                     # Mock data and constants
│   ├── categories.dart       # Category definitions and data
│   └── dummy_items.dart      # Sample grocery items
├── models/                   # Data models
│   ├── category.dart         # Category model and enum
│   └── grocery_item.dart     # Grocery item model
└── widgets/                  # UI components
    ├── grocery_list.dart     # Main grocery list widget
    └── grocery_item_tile.dart # Individual item tile widget
```

### **Design Principles**
- **Single Responsibility**: Each class/widget has a focused purpose
- **Separation of Concerns**: Clear distinction between data, models, and UI
- **Reusable Components**: Modular widgets for better maintainability
- **Type Safety**: Strong typing with custom enums and models

## 🎨 Design & UI

- **Material Design 3**: Modern design system with custom color scheme
- **Dark Theme**: Elegant dark theme with cyan accent colors
- **Custom Color Palette**: 
  - Primary: Cyan Blue (`#93E5FA`)
  - Surface: Dark Blue Gray (`#2A333B`)
  - Background: Charcoal (`#323A3C`)
- **Typography**: Clean, readable text with proper hierarchy
- **Icons**: Intuitive Material Icons for better user experience

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK 3.8.1 or higher
- Dart SDK 3.8.1 or higher
- iOS Simulator / Android Emulator or physical device
- VS Code or Android Studio (recommended)

### **Installation**

1. **Clone the repository:**
```bash
git clone https://github.com/dmakarau/grocerylist.git
cd grocerylist
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run the application:**
```bash
flutter run
```

## 🧪 Testing

This project includes comprehensive testing coverage with **25 test cases** across multiple layers:

### **Test Categories**
- **Unit Tests**: Model validation and business logic
- **Widget Tests**: UI component behavior and rendering
- **Integration Tests**: End-to-end user interactions

### **Running Tests**
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/models/category_test.dart
```

### **Test Coverage**
- ✅ **Category Model**: Enum validation and category creation
- ✅ **Grocery Item Model**: Item properties and validation
- ✅ **Widget Components**: UI rendering and interactions
- ✅ **Data Integrity**: Mock data validation

## 🛠️ Development Commands

| Command | Description |
|---------|-------------|
| `flutter run` | Run the app in debug mode |
| `flutter build apk` | Build Android APK |
| `flutter build ios` | Build iOS app |
| `flutter test` | Run all tests |
| `flutter analyze` | Run static analysis |
| `flutter pub get` | Install dependencies |
| `flutter pub upgrade` | Upgrade dependencies |
| `flutter clean` | Clean build artifacts |

## 📦 Dependencies

### **Production Dependencies**
- **flutter**: SDK for building the application
- **cupertino_icons**: iOS-style icons

### **Development Dependencies**
- **flutter_test**: Testing framework for Flutter applications
- **flutter_lints**: Dart linting rules for code quality

## 🔄 Continuous Integration

This repository uses GitHub Actions for automated testing and quality assurance with a **build-first** approach.

### **CI/CD Pipeline Structure**
1. **🏗️ Build Job** (runs first)
   - Multi-platform compilation verification (Android & Web)
   - Flutter environment setup and validation
   - Dependency installation and caching
   - Build artifact generation with 7-day retention

2. **🧪 Test Job** (runs after successful build)
   - Static analysis with `flutter analyze`
   - Code formatting verification with `dart format`
   - Comprehensive test suite execution (25 tests)
   - Test results artifact upload

### **CI/CD Features**
- **🚀 Fail Fast**: Build verification before running expensive tests
- **📦 Multi-Platform Builds**: Validates Android APK and Web builds simultaneously  
- **🧪 Comprehensive Testing**: Static analysis, formatting, and unit tests
- **⚡ Performance Optimized**: Pub dependency caching for faster builds
- **🔄 Flexible Triggers**: Push to main, Pull Requests, Manual dispatch
- **📊 Artifact Management**: Build outputs and test results with retention policies

**Workflow Details:**
- 📁 **Workflow File**: `.github/workflows/dart.yml`
- 🔄 **Triggers**: Push to main, Pull Requests, Manual dispatch
- 🧪 **Flutter Version**: Latest stable channel
- ⚡ **Caching**: Pub dependencies for faster builds
- 🏗️ **Build Strategy**: Matrix builds for Android and Web platforms

## 📱 Supported Platforms

| Platform | Support | Notes |
|----------|---------|-------|
| 📱 **Android** | ✅ Full Support | Optimized for Android 21+ |
| 🍎 **iOS** | ✅ Full Support | Compatible with iOS 12+ |
| 🌐 **Web** | ✅ Full Support | Progressive Web App ready |
| 🖥️ **Desktop** | ⚠️ Compatible | Windows, macOS, Linux support |

## 🗂️ Data Models

### **Category Model**
```dart
enum Categories {
  vegetables, fruit, meat, dairy, carbs, 
  sweets, spices, convenience, hygiene, other
}

class Category {
  final String id;
  final String title;
  final Color color;
}
```

### **Grocery Item Model**
```dart
class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;
}
```

## 🎯 Key Learning Objectives

This project demonstrates proficiency in:

- **📱 Flutter Development**: Modern mobile app development
- **🏗️ Clean Architecture**: Well-structured, maintainable code
- **🧪 Test-Driven Development**: Comprehensive testing practices
- **🎨 UI/UX Design**: Material Design 3 implementation
- **🔄 DevOps**: CI/CD with GitHub Actions
- **📚 Documentation**: Professional project documentation

## 🤝 Contributing

This is an educational project, but contributions are welcome:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is created for educational purposes and learning Flutter development.

## 📚 Educational Context

This project serves as a practical implementation of Flutter development concepts including:

- **State Management**: Effective widget state handling
- **Custom Widgets**: Creating reusable UI components
- **Data Modeling**: Implementing proper data structures
- **Testing Strategies**: Unit, widget, and integration testing
- **Project Organization**: Clean file structure and architecture
- **Modern UI Design**: Material Design 3 implementation

---

## 💡 About

This Flutter grocery list application demonstrates modern mobile development practices with a focus on clean code, comprehensive testing, and professional project setup. Perfect for learning Flutter development patterns and best practices.

**Built with ❤️ using Flutter**
