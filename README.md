# 🛒 Flutter Grocery List

A modern, elegant grocery list management application built with Flutter. This project demonstrates clean architecture, comprehensive testing, and professional development practices for mobile app development.

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
- **🎨 Category Icons**: Material Design icons for visual category identification (� Vegetables, 🍎 Fruit, 🍽️ Meat, etc.)
- **✅ Form Validation**: Comprehensive input validation with helpful error messages
- **🎨 Modern UI**: Material Design 3 with contemporary color scheme and dark theme
- **📱 Responsive Design**: Optimized for various screen sizes with smooth animations
- **🏷️ Smart Categories**: 10 pre-defined categories with color coding and icons
- **📦 Quantity Badges**: Modern pill-shaped quantity indicators
- **🎯 Clean Architecture**: Well-structured codebase with 100% test coverage (48 tests)

## 🚀 Quick Start

### Prerequisites
- Flutter SDK 3.8.1 or later
- Dart SDK 3.8.1 or later
- Android Studio / VS Code with Flutter plugins

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/dmakarau/grocerylist.git
   cd grocery_list
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Run tests**
   ```bash
   flutter test
   ```

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point with theme configuration
├── data/
│   └── categories.dart       # Category definitions and colors
├── models/
│   ├── category.dart         # Category enum and model
│   └── grocery_item.dart     # GroceryItem model
└── widgets/
    ├── grocery_list.dart     # Main grocery list widget
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
- **Category Icons**: Material Design icons for category identification (local_florist, apple, set_meal, local_drink, bakery_dining, cake, grass, shopping_bag, clean_hands)
- **Quantity Badges**: Modern pill-shaped indicators with category-matched colors
- **Interactive Forms**: Rounded input fields with "What do you need?" modern header
- **Empty State**: Engaging circular shopping cart icon with welcoming message

### Color System
- **Primary**: Beautiful Blue (`#4A90E2`) 
- **Category Colors**: Accessible palette with proper contrast ratios
- **Cards**: Clean white/dark surfaces with subtle shadows
- **Accents**: Category-specific colors for visual organization

## 🧠 Core Concepts

### Categories
```dart
enum Categories {
  vegetables, fruit, meat, dairy, carbs, sweets, spices, convenience, hygiene, other
}
```

### Models
```dart
class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;
}
```

## 🧪 Testing

This project includes comprehensive testing coverage with **48 test cases** across multiple layers:

### Test Structure
```
test/
├── widget_test.dart          # Integration tests
├── models/
│   ├── category_test.dart    # Category model tests
│   └── grocery_item_test.dart # GroceryItem model tests
└── widgets/
    ├── grocery_list_test.dart # Grocery list widget tests
    ├── grocer_item_tile_test.dart # Item tile widget tests
    └── new_item_test.dart     # New item form tests
```

### Running Tests
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Generate coverage report (requires lcov)
genhtml coverage/lcov.info -o coverage/html
```

### Test Coverage
- ✅ **Unit Tests**: Models and business logic
- ✅ **Widget Tests**: UI components and interactions
- ✅ **Integration Tests**: Complete user workflows
- ✅ **Form Validation**: Input validation and error handling
- ✅ **State Management**: Dynamic UI updates and data flow

## 🚀 CI/CD Pipeline

This project uses **GitHub Actions** for continuous integration:

### Workflow Features
- ✅ **Automated Testing**: Runs all 48 tests on every push/PR
- ✅ **Multi-Platform**: Tests on Ubuntu latest
- ✅ **Flutter Setup**: Automatic Flutter SDK installation
- ✅ **Dependency Caching**: Optimized build times
- ✅ **Code Quality**: Automated test reporting

### Workflow File
`.github/workflows/ci.yml` - Comprehensive CI pipeline with Flutter testing

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
- 🎯 **Category system** with Material Design icons and color coding
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

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for the beautiful design system
- The Flutter community for inspiration and best practices

---

<div align="center">
  <strong>Built with ❤️ using Flutter</strong>
</div>