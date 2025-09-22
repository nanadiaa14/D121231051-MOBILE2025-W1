abstract class ApiClient {
  // Mengembalikan list JSON post (seolah response REST)
Future<List<Map<String, dynamic>>> getPosts();
}

///Fake API client untuk kelas. Data hardcoded di sini.
/// Kamu bisa mengganti implementasi ini ke real HTTP client

class FakeApiClient implements ApiClient {
  final bool shouldFail; // untuk simulasi error dari network
  FakeApiClient({this.shouldFail = false});
  @override
  Future<List<Map<String, dynamic>>> getPosts() async {
    // simulasi network latency
    await Future.delayed(const Duration(milliseconds: 800));
    if (shouldFail) {
      throw Exception('Simulated network error');
    }
    return [
      {
        'id' : 1,
        'title' : 'Hello Flutter',
        'body' : 'Ini adalah contoh posting pertama (hardcoded).'
      },
      {
        'id' : 2,
        'title' : 'Lee Sangwon',
        'body' : 'Born in 2003'
      },
      {
        'id': 3,
        'title' : 'Lee Leo',
        'body' : 'Born in 2002'
      }
    ];
  }
}