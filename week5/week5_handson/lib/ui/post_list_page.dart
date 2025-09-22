import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/post_controller.dart';
import '../models/post.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PostController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Postingan (Hands-on)')),
      body: Builder(builder: (context) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error != null) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Error: ${controller.error}', textAlign: TextAlign.center),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => controller.loadPosts(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.posts.isEmpty) {
          return Center(
            child: Text('Belum ada postingan. Tarik untuk refresh.'),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.loadPosts,
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: controller.posts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final Post p = controller.posts[index];
              return Card(
                child: ListTile(
                  title: Text(p.title),
                  subtitle: Text(p.body, maxLines: 3, overflow: TextOverflow.ellipsis),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}