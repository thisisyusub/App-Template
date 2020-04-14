/// Constants for SharedPreferences
class SharedPrefKeys {
  SharedPrefKeys._();
  static const String token = 'token';
  static const String id = 'id';
  static const String loggedIn = 'loggedIn';
  static const String darkModeEnabled = 'darkModeEnabled';
  static const String languageCode = 'languageCode';
  static const String username = 'username';
  static const String email = 'email';
}

/// Constants for Routes
class Routes {
  Routes._();

  static const String home = 'Home';
  static const String login = 'Login';
  static const String register = 'register';
}

/// Constants for lang translation keys
class JsonKeys {
  JsonKeys._();

  static const String enterUserId = "enter_user_id";
  static const String login = "login";
  static const String or_register = "or_register";
}

/// Constants for language
class LanguageKeys {
  LanguageKeys._();

  static const String az = 'az';
  static const String en = 'en';
  static const String enterUserId = 'enter_user_id';
  static const String login = 'login';
  static const String orRegister = 'or_register';
  static const String loginPage = 'login_page';
  static const String selectLanguage = 'select_language';
  static const String cancel = 'cancel';
  static const String homePage = 'home_page';
}

/// Constants for database
class DatabaseKeys {
  DatabaseKeys._();

  /// [Post] table
  static const String postTable = 'Post';
  static const String postId = 'postId';
  static const String userId = 'userId';
  static const String title = 'title';
  static const String body = 'body';

  /// [Comment table]
  static const String commentTable = 'Comment';
}
