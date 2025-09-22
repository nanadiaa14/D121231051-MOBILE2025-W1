import 'package:flutter/foundation.dart';
import 'package:week5_handson/models/post.dart';
import 'package:week5_handson/repositories/post_repository.dart';

class PostController extends ChangeNotifier {
  final PostRepository repository;
  List<Post> posts = [];
  bool isLoading = false;
  String? error;
  PostController(this.repository);
  Future<void> loadPosts() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      posts = await repository.fetchPosts();
    } catch (e, st) {
      error = e.toString();
      // optional: print or log stacktrace
      if (kDebugMode) {
        //ignore : avoid print
        print('Error loadPosts: $e\n$st');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}