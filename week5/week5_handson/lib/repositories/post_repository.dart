import 'package:week5_handson/models/post.dart';

abstract class PostRepository {
  // Future similiar with primues
  Future<List<Post>> fetchPosts();
}