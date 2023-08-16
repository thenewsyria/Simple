import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/post_provider.dart';

class PostsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postsProvider = Provider.of<PostsProvider>(context);
    final posts = postsProvider.posts;

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.category),
          leading: Image.network(post.image),
        );
      },
    );
  }
}
