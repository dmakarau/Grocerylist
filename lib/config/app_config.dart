import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Configuration class to handle environment variables and app settings
/// 
/// This class provides a centralized way to access configuration values
/// from environment variables with fallback defaults for security.
class AppConfig {
  /// Firebase Realtime Database URL
  /// 
  /// Loaded from environment variable FIREBASE_DATABASE_URL
  /// Falls back to localhost for development if not configured
  static String get firebaseDatabaseUrl {
    return dotenv.env['FIREBASE_DATABASE_URL'] ?? 'localhost:9000';
  }

  /// Check if we're running in production mode
  static bool get isProduction {
    return dotenv.env['FLUTTER_ENV'] == 'production';
  }

  /// Check if we're running in development mode
  static bool get isDevelopment {
    return !isProduction;
  }

  /// Get the complete Firebase Realtime Database URL with path
  static Uri getFirebaseUrl(String path) {
    if (isDevelopment && firebaseDatabaseUrl == 'localhost:9000') {
      // In development with fallback, use HTTP for local emulator
      return Uri.http(firebaseDatabaseUrl, path);
    }
    
    // In production or with proper URL, use HTTPS
    return Uri.https(firebaseDatabaseUrl, path);
  }
}