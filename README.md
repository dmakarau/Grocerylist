# 🛒 Flutter Grocery List

A modern, elegant grocery list management application built with Flutter. This project demonstrates clean architecture, comprehensive testing, and professional development practices for mobile app development.

![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.8.1+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material Design](https://img.shields.io/badge/Material%20Design%203-757575?style=for-the-badge&logo=material-design&logoColor=white)
![License](https://img.shields.io/badge/License-Educational-green?style=for-the-badge)

## 📱 Features

- **➕ Add Items**: Interactive form to add new grocery items with validation
- **🗑️ Delete Items**: Swipe-to-delete functionality for easy item removal
- **📋 Grocery Management**: Add, view, and organize grocery items with categories
- **✅ Form Validation**: Comprehensive input validation for names and quantities
- **🎨 Modern UI**: Material Design 3 with custom dark theme and color scheme
- **📱 Responsive Design**: Optimized for various screen sizes and orientations
- **🏷️ Category System**: Organized items by categories (Vegetables, Fruits, Meat, Dairy, etc.)
- **📦 Quantity Tracking**: Track quantities for each grocery item
- **🎯 Clean Architecture**: Well-structured codebase with separation of concerns
- **🔄 Dynamic State**: Real-time updates with proper state management

## 🏗️ Architecture & Design

### **Project Structure**
```
lib/
├── main.dart                 # Application entry point
├── data/                     # Data and constants
│   └── categories.dart       # Category definitions and data
├── models/                   # Data models
│   ├── category.dart         # Category model and enum
│   └── grocery_item.dart     # Grocery item model
└── widgets/                  # UI components
    ├── grocery_list.dart     # Main grocery list widget with add/delete
    ├── grocer_item_tile.dart # Individual item tile widget
    └── new_item.dart         # Add new item form widget
```

### **Design Principles**
- **Single Responsibility**: Each class/widget has a focused purpose
- **Separation of Concerns**: Clear distinction between data, models, and UI
- **Reusable Components**: Modular widgets for better maintainability
- **Type Safety**: Strong typing with custom enums and models
- **User Experience**: Intuitive interactions with form validation and visual feedback
- **State Management**: Efficient StatefulWidget usage for dynamic content

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

### **Key User Interactions**

#### **➕ Adding Items**
1. Tap the **"+"** button in the app bar
2. Fill in the item details:
   - **Name**: Enter item name (2-50 characters)
   - **Quantity**: Set the quantity (positive number)
   - **Category**: Select from predefined categories with color indicators
3. Tap **"Add Item"** to save or **"Reset"** to clear the form
4. Navigate back automatically after successful submission

#### **🗑️ Deleting Items**
- **Swipe left** on any item in the list to reveal the delete action
- **Visual feedback**: Red background with delete icon appears during swipe
- Item is **immediately removed** from the list after swipe completion

#### **📱 Empty State**
- Displays helpful message when no items are present
- Encourages users to add their first item

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

This project includes comprehensive testing coverage with **47 test cases** across multiple layers:

### **Test Categories**
- **Unit Tests**: Model validation and business logic
- **Widget Tests**: UI component behavior, form validation, and user interactions  
- **Integration Tests**: End-to-end user workflows (add, delete, navigation)

### **Running Tests**
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/widgets/new_item_test.dart
```

### **Test Coverage**
- ✅ **NewItem Widget**: Form validation, submission, navigation (15 tests)
- ✅ **GroceryList Widget**: Add/delete functionality, state management (14 tests)
- ✅ **Integration Tests**: Complete user workflows and edge cases (8 tests)
- ✅ **Widget Components**: UI rendering and interactions (10 tests)
- ✅ **Data Integrity**: Model validation and category system

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
   - Comprehensive test suite execution (47 tests)
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

- **📱 Flutter Development**: Modern mobile app development with stateful widgets
- **🏗️ Clean Architecture**: Well-structured, maintainable code organization
- **🧪 Test-Driven Development**: Comprehensive testing practices (47 test cases)
- **🎨 UI/UX Design**: Material Design 3 with intuitive user interactions
- **📝 Form Handling**: Input validation, user feedback, and error handling
- **🎯 State Management**: Dynamic UI updates and data persistence
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

- **State Management**: Effective widget state handling with StatefulWidget
- **Form Development**: Input validation, user feedback, and data collection
- **User Interactions**: Gesture handling, navigation, and dismissible actions
- **Custom Widgets**: Creating reusable UI components and form elements
- **Data Modeling**: Implementing proper data structures and ID generation
- **Testing Strategies**: Unit, widget, and integration testing methodologies
- **Project Organization**: Clean file structure and scalable architecture
- **Modern UI Design**: Material Design 3 with interactive elements

---

## 💡 About

This Flutter grocery list application demonstrates modern mobile development practices with a focus on clean code, comprehensive testing, and professional project setup. Perfect for learning Flutter development patterns and best practices.

**Built with ❤️ using Flutter**
