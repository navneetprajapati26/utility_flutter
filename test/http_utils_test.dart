import 'package:utility_package/http_utils.dart';

void main() async {
  final apiRepo = HttpOperationsRepository(
    'https://jsonplaceholder.typicode.com/',
    defaultHeaders: {'Content-Type': 'application/json'},
    timeoutDuration: Duration(seconds: 5),
  );

  // Example usages:
  try {
    final post = await apiRepo.get('posts/1');
    print(post);

    final newPost = await apiRepo.post('posts', body: {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    });
    print(newPost);
  } catch (e) {
    print('Error: $e');
  }
}
