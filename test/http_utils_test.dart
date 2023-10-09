
import 'package:flutter_test/flutter_test.dart';
import 'package:utility_package/http_utils.dart';

void main() {
  HttpOperationsRepository? apiRepo;

  setUp(() {
    apiRepo = HttpOperationsRepository(
      'https://jsonplaceholder.typicode.com/',
      defaultHeaders: {'Content-Type': 'application/json'},
      timeoutDuration: Duration(seconds: 5),
    );
  });

  test('GET request', () async {
    final post = await apiRepo!.get('posts/1');
    expect(post, isNotNull);
  });

  test('POST request', () async {
    final newPost = await apiRepo!.post('posts', body: {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    });
    expect(newPost, isNotNull);
  });
}
