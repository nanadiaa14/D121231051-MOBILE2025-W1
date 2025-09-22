// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api/api_client.dart';
import 'controllers/post_controller.dart';
import 'repositories/post_repository_impl.dart';
import 'ui/post_list_page.dart';
import 'repositories/post_repository.dart';

void main() {
  // Composition root: buat/konfigurasi dependensi di sini
  final ApiClient apiClient = FakeApiClient(shouldFail: false);
  final PostRepository postRepository = PostRepositoryImpl(apiClient);

  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClient>.value(value: apiClient),
        Provider<PostRepository>.value(value: postRepository),
        ChangeNotifierProvider<PostController>(
          create: (_) => PostController(postRepository)..loadPosts(), // langsung load saat start
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PostListPage(),
    );
  }
}