

part of 'utility_flutter.dart';

class HttpUtils {
  final String baseUrl;
  final Map<String, String> defaultHeaders;
  final Duration timeoutDuration;

  HttpUtils(this.baseUrl,
      {this.defaultHeaders = const {},
      this.timeoutDuration = const Duration(seconds: 10)});

  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    return _performRequest(() => http.get(Uri.parse(baseUrl + endpoint),
        headers: {...defaultHeaders, ...?headers}));
  }

  Future<dynamic> post(String endpoint,
      {dynamic body, Map<String, String>? headers}) async {
    return _performRequest(() => http.post(Uri.parse(baseUrl + endpoint),
        body: jsonEncode(body), headers: {...defaultHeaders, ...?headers}));
  }

  Future<dynamic> put(String endpoint,
      {dynamic body, Map<String, String>? headers}) async {
    return _performRequest(() => http.put(Uri.parse(baseUrl + endpoint),
        body: jsonEncode(body), headers: {...defaultHeaders, ...?headers}));
  }

  Future<dynamic> delete(String endpoint,
      {Map<String, String>? headers}) async {
    return _performRequest(() => http.delete(Uri.parse(baseUrl + endpoint),
        headers: {...defaultHeaders, ...?headers}));
  }

  Future<dynamic> _performRequest(
      Future<http.Response> Function() requestFunc) async {
    try {
      final response = await requestFunc().timeout(timeoutDuration);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      } else {
        throw HttpException(response.body, uri: response.request?.url);
      }
    } catch (e) {
      //print('HTTP error: $e'); // Use a logger in a real-world application
      // throw e;
      rethrow;
    }
  }
}

class HttpException implements Exception {
  final String message;
  final Uri? uri;

  HttpException(this.message, {this.uri});

  @override
  String toString() {
    if (uri != null) {
      return 'HttpException ($uri): $message';
    }
    return 'HttpException: $message';
  }
}
