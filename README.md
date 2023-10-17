# utility_flutter

This package provides a comprehensive utility to handle common *HTTP* and *shared preferences* operations with ease. Built around the `http` and `shared_preferences` package, it integrates seamlessly with Flutter and Dart applications, offering features like setting default headers, configuring request timeouts, and delivering standardized error responses and storing smale variables in device.


| utility_flutter         | [![pub package](https://img.shields.io/pub/v/riverpod.svg?label=utility_flutter&color=blue)](https://pub.dev/packages/utility_flutter)                 |

## 🌟 Features

## HttpUtils

- **Simplified HTTP Requests**: Perform GET, POST, PUT, and DELETE operations with just a few lines of code.
- **Consistent Base URL**: Define a base URL once and forget about repeating it for every request.
- **Default Headers**: Easily set default headers that automatically accompany every HTTP request.
- **Timeouts**: A default timeout duration ensures your requests don't hang indefinitely.
- **Standardized Errors**: Understand and handle HTTP errors better with standardized error responses.

- **Create an instance of `HttpUtils`**: Create an instance of the HttpUtils class by providing the baseUrl for your API. You can also specify optional parameters like defaultHeaders and timeoutDuration. For example:

```dart
final httpUtils = HttpUtils('https://api.example.com', defaultHeaders: {
  'Authorization': 'Bearer your_token_here',
});
```
- **GET Request**:
```dart
try {
  final response = await httpUtils.get('/endpoint');
  // Handle the response
} catch (e) {
  // Handle errors
}

  ```
  
- **POST Request**:
```dart
try {
  final body = {'key': 'value'};
  final response = await httpUtils.post('/endpoint', body: body);
  // Handle the response
} catch (e) {
  // Handle errors
}

  ```

- **PUT Request**:
```dart
try {
  final body = {'key': 'value'};
  final response = await httpUtils.put('/endpoint', body: body);
  // Handle the response
} catch (e) {
  // Handle errors
}

  ```

- **DELETE Request**:
```dart
try {
  final response = await httpUtils.delete('/endpoint');
  // Handle the response
} catch (e) {
  // Handle errors
}

  ```
- if your API have no need of defaultHeaders or headers, you no need to initializes this .


## PreferencesUtils

- **Initialize the PreferencesUtils instance** : use in your project .

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required to use async methods in the main function.
  final preferences = PreferencesUtils();
  await preferences.init();

  runApp(MyApp());
}
```
- **Initialize the PreferencesUtils instance**
```dart
// Get a PreferencesUtils instance.
final preferences = PreferencesUtils();

// Storing data:
await preferences.setBool('isDarkMode', true);
await preferences.setInt('userAge', 25);
await preferences.setDouble('userHeight', 175.5);
await preferences.setString('username', 'navneet');

```
- `isDarkMode`, `userAge`, `userHeight`, `username ` these are key using this you can get stored data from your device. 
```dart
// Retrieving data:
bool isDarkMode = preferences.getBool('isDarkMode');
int userAge = preferences.getInt('userAge');
double userHeight = preferences.getDouble('userHeight');
String username = preferences.getString('username');

// Clearing preferences:
preferences.clear();
```

## 🚀 Getting Started

### Prerequisites


To use this package:

- Ensure you have Flutter and Dart SDK installed.

[//]: # (- Add the `http` package to your `pubspec.yaml` as this package depends on it.)

### Installation

1. Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  utility_package: <latest_version>
```
or Run this command:
```command
flutter pub add utility_flutter
```

2. Import it in your Dart code, you can use:
```dart
import 'package:utility_flutter/utility_flutter.dart';
```

