import 'dart:async';
import 'dart:convert';
import 'dart:io';

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return MockHttpClient();
  }
}

class MockHttpClient implements HttpClient {
  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    return MockHttpClientRequest(url);
  }

  // Implement other methods if needed (POST, PUT, DELETE)
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockHttpClientRequest implements HttpClientRequest {
  final Uri url;
  MockHttpClientRequest(this.url);

  @override
  Future<HttpClientResponse> close() async {
    return MockHttpClientResponse(url);
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockHttpClientResponse extends Stream<List<int>> implements HttpClientResponse {
  final Uri url;
  MockHttpClientResponse(this.url);

  @override
  int get statusCode => 200;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> data)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    final jsonResponse = _getMockResponse(url.path);
    final encodedResponse = utf8.encode(jsonResponse);
    final stream = Stream.value(encodedResponse);
    return stream.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  String _getMockResponse(String path) {
    if (path == '/posts') {
      return '[{"id": 1, "title": "Post 1"}]';
    } else if (path.startsWith('/posts/') && path.endsWith('/comments')) {
      return '[{"id": 1, "body": "Comment 1"}]';
    } else if (path == '/albums') {
      return '[{"id": 1, "title": "Album 1"}]';
    } else if (path.startsWith('/albums/') && path.endsWith('/photos')) {
      return '[{"id": 1, "url": "photo.jpg"}]';
    }
    return '[]';
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
