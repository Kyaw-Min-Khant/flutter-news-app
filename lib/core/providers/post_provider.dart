import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  List<dynamic> _posts = [];
  bool _isLoading = false;

  List<dynamic> get posts => _posts;
  bool get isLoading => _isLoading;

  void setPosts(List<dynamic> newPosts) {
    _posts = newPosts;
    notifyListeners();
  }

  void setLoading(bool loadingState) {
    _isLoading = loadingState;
    notifyListeners();
  }
}
