# 🛒 Flutter Grocery List

A m  </table>
</div>

> **📝 To display screenshots**: Save your app screenshots as PNG files in the `screenshots/` directory with these exact names:
> - `empty_state.png` - Modern empty state with circular shopping cart icon
> - `add_item.png` - "What do you need?" form with modern input fields  
> - `grocery_list.png` - Grocery list with card-based items and category icons

## 📱 Featuresn, elegant grocery list management application built with Flutter. This project demonstrates clean architecture, comprehensive testing, and professional development practices for mobile app development.

![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.8.1+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material Design](https://img.shields.io/badge/Material%20Design%203-757575?style=for-the-badge&logo=material-design&logoColor=white)
![License](https://img.shields.io/badge/License-Educational-green?style=for-the-badge)

## � Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="screenshots/empty_state.png" width="250" alt="Empty State"/>
        <br/>
        <em>🏠 Empty State</em>
      </td>
      <td align="center">
        <img src="screenshots/add_item.png" width="250" alt="Add New Item"/>
        <br/>
        <em>➕ Add New Item</em>
      </td>
      <td align="center">
        <img src="screenshots/grocery_list.png" width="250" alt="Grocery List"/>
        <br/>
        <em>📋 Grocery List</em>
      </td>
    </tr>
  </table>
</div>

## �📱 Features

- **➕ Add Items**: Interactive form with modern card design and category icons
- **🗑️ Delete Items**: Swipe-to-delete functionality with visual feedback
- **📋 Modern Card Design**: Beautiful card-based grocery items with category icons
- **🎨 Category Icons**: Visual category indicators (🍎 Fruit, 🥬 Vegetables, 🥩 Meat, etc.)
- **✅ Form Validation**: Comprehensive input validation with helpful error messages
- **🎨 Modern UI**: Material Design 3 with contemporary color scheme and dark theme
- **📱 Responsive Design**: Optimized for various screen sizes with smooth animations
- **🏷️ Smart Categories**: 10 pre-defined categories with color coding and icons
- **📦 Quantity Badges**: Modern pill-shaped quantity indicators
- **🎯 Clean Architecture**: Well-structured codebase with 100% test coverage (48 tests)

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
- **Modern Material Design**: Material Design 3 implementation with card-based layouts
- **State Management**: Efficient StatefulWidget usage for dynamic content

## 🎨 Design & UI

### Modern Material Design 3
- **Beautiful Color Scheme**: Primary blue color (`#4A90E2`) with Material 3 color system
- **Card-Based Layout**: Contemporary cards with 16px rounded corners and subtle elevation
- **Dynamic Theming**: Automatic light/dark theme support based on system preferences
- **Enhanced Typography**: Modern text hierarchy with improved readability

### Visual Elements
- **Category Icons**: Emoji-based category identification (🍎🥬🥩🥛🍞🥫🧴🍫🥤🧽)
- **Quantity Badges**: Modern pill-shaped indicators with category-matched colors
- **Interactive Forms**: Rounded input fields with "What do you need?" modern header
- **Empty State**: Engaging circular shopping cart icon with welcoming message

### Color System
- **Primary**: Beautiful Blue (`#4A90E2`) 
- **Category Colors**: Accessible palette with proper contrast ratios
- **Cards**: Clean white/dark surfaces with subtle shadows
- **Accents**: Category-specific colors for visual organization
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

This project includes comprehensive testing coverage with **48 test cases** across multiple layers:

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

- **📱 Flutter Development**: Modern mobile app development with Material Design 3
- **🏗️ Clean Architecture**: Well-structured, maintainable code organization
- **🧪 Test-Driven Development**: Comprehensive testing practices (48 test cases)
- **🎨 Modern UI/UX Design**: Contemporary card-based layouts with intuitive interactions
- **📝 Form Handling**: Beautiful form design with validation and user feedback
- **🎯 State Management**: Dynamic UI updates and data persistence
- **🌈 Theming**: Advanced Material 3 color system with light/dark theme support
- **♿ Accessibility**: WCAG compliant design with proper contrast and screen reader support
- **🔄 DevOps**: CI/CD with GitHub Actions
- **📚 Documentation**: Professional project documentation

## ✨ Design Modernization

This app showcases a complete design transformation from basic Material Design to contemporary Material Design 3:

### Before → After
- **ListTile** → **Card-based layouts** with beautiful shadows and rounded corners
- **Basic forms** → **Modern input fields** with "What do you need?" headers
- **Plain text** → **Category icons and quantity badges** for visual organization
- **Simple colors** → **Beautiful blue color scheme** (#4A90E2) with proper theming
- **Empty state** → **Engaging circular icon** with welcoming messaging

### Modern Features
- 🎨 **Material Design 3** implementation with dynamic theming
- 🃏 **Card components** with 16px rounded corners and subtle elevation
- 🎯 **Category system** with emoji icons and color coding
- 💊 **Pill-shaped badges** for quantity display
- 🌙 **Automatic dark theme** support
- ✨ **Smooth animations** and intuitive interactions

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
