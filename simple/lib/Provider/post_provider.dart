import 'package:flutter/material.dart';

import '../Controller/post_controller.dart';
import '../Model/post_model.dart';

class PostsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    _posts = await _apiService.fetchPosts();
    notifyListeners();
  }
}
