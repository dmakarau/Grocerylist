# Environment Setup Guide

This guide explains how to securely configure your Firebase connection using environment variables.

## 🔧 Quick Setup

### 1. Create Environment File
Copy the example environment file and configure your settings:

```bash
cp .env.example .env
```

### 2. Configure Firebase URL
Edit `.env` file with your Firebase project details:

```env
# Firebase Configuration
FIREBASE_DATABASE_URL=your-project-id-default-rtdb.region.firebasedatabase.app

# Optional: Environment setting
FLUTTER_ENV=production
```

### 3. Find Your Firebase URL
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Navigate to **Realtime Database**
4. Copy the URL (without `https://` and without the path)

Example: `grocerylist-38f39-default-rtdb.europe-west1.firebasedatabase.app`

## 🔒 Security Features

### Environment Variables
- **Secure**: Sensitive URLs are stored in `.env` file (never committed)
- **Flexible**: Easy to switch between development and production
- **Safe Fallback**: Defaults to localhost if configuration is missing

### Configuration Class
The `AppConfig` class provides:
- Centralized configuration management
- Automatic environment detection
- Safe fallback values for development
- Type-safe access to environment variables

### File Structure
```
├── .env                    # Your private configuration (DO NOT COMMIT)
├── .env.example           # Example template (safe to commit)
├── lib/config/
│   └── app_config.dart    # Configuration management class
```

## 🚀 Usage in Code

```dart
import 'package:grocery_list/config/app_config.dart';

// Get Firebase URL with path
final url = AppConfig.getFirebaseUrl('groceries.json');

// Check environment
if (AppConfig.isDevelopment) {
  print('Running in development mode');
}
```

## ⚠️ Important Security Notes

1. **Never commit `.env` file** - It contains sensitive information
2. **Always use `.env.example`** - Safe template for other developers
3. **Configure Firebase Security Rules** - Restrict database access
4. **Consider Authentication** - Add user authentication for production

## 🔄 Migration from Hardcoded URLs

If you previously had hardcoded Firebase URLs in your code:

### Before (❌ Not Secure)
```dart
final url = Uri.https('your-project.firebasedatabase.app', 'data.json');
```

### After (✅ Secure)
```dart
final url = AppConfig.getFirebaseUrl('data.json');
```

## 🛠️ Development vs Production

### Development
- Uses `.env` file for configuration
- Falls back to localhost if not configured
- Supports Firebase emulator suite

### Production
- Set `FLUTTER_ENV=production` in environment
- Use secure deployment practices
- Configure proper Firebase security rules

---

**Remember**: Keep your `.env` file private and never share sensitive configuration data!