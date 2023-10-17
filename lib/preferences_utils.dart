
part of 'utility_flutter.dart';

class PreferencesUtils {

  // Singleton instance
  static final PreferencesUtils _instance = PreferencesUtils._internal();

  // Private constructor
  PreferencesUtils._internal();

  // Factory method to get instance
  factory PreferencesUtils() => _instance;

  // SharedPreferences instance
  SharedPreferences? _prefs;

  // Initialize preferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getter for prefs instance
  SharedPreferences? get prefs => _prefs;

  // Simple read/write methods

  bool getBool(String key) => _prefs!.getBool(key) ?? false;

  int getInt(String key) => _prefs!.getInt(key) ?? 0;

  double getDouble(String key) => _prefs!.getDouble(key) ?? 0.0;

  String getString(String key) => _prefs!.getString(key) ?? '';

  // Write methods

  Future<bool> setBool(String key, bool value) => _prefs!.setBool(key, value);

  Future<bool> setInt(String key, int value) => _prefs!.setInt(key, value);

  Future<bool> setDouble(String key, double value) => _prefs!.setDouble(key, value);

  Future<bool> setString(String key, String value) => _prefs!.setString(key, value);

  // Clear preferences
  void clear() => _prefs!.clear();

}