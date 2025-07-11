import 'package:blog_app/features/home/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List<dynamic> posts;
  const NewsList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return NewsCard(post: post);
        },
      ),
    );
  }
}
