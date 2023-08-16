import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/post_model.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
    final response = await http
        .get(Uri.parse('https://www.thebrand.ai/i/prompt?page=0&mode=home'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final postsData = jsonData['posts'];
      List<Post> posts = [];

      for (var post in postsData) {
        if (post['image_default'] != null) {
          posts.add(Post(
            id: post['id'],
            title: post['title'],
            keywords: post['keywords'],
            category: post['category_name'],
            image: 'https://www.thebrand.ai/i/${post['image_default']}',
          ));
        }
      }

      return posts;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
