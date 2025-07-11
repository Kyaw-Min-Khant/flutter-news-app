import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

final String notFoundUrl =
    "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=";

class New extends StatelessWidget {
  const New({super.key, required this.post});
  final Map<String, dynamic> post;
  String formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return 'Unknown Date';
    }
    try {
      final dateTime = DateTime.parse(dateString); // Parse the date string
      // Format the date manually (e.g., "MMM dd, yyyy")
      final month =
          [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec',
          ][dateTime.month - 1];
      return '$month ${dateTime.day}, ${dateTime.year}';
    } catch (e) {
      return 'Invalid Date'; // Handle parsing errors
    }
  }

  @override
  Widget build(BuildContext context) {
    // final publishedDate = DateTime(post['publishedAt']);
    // debugPrint("Published Date: $publishedDate");

    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 5,
          children: [
            AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  size: 20,
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
                onPressed: () => context.go('/'),
              ),
              title: Text(
                post['source']?['name'] ?? 'No Title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: "lib/assets/images/loading.jpg",
              image: post['urlToImage'] ?? notFoundUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.start,
                  post['title'] ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Authors : ${post['author'] ?? 'Unknown Author'}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(221, 40, 39, 39),
                    ),
                  ),
                  Text(
                    formatDate(post['publishedAt']),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(221, 40, 39, 39),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                textAlign: TextAlign.start,
                post['content'] ?? '',
                style: TextStyle(
                  color: const Color.fromARGB(221, 40, 39, 39),
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => {launchUrl(Uri.parse(post['url']!))},
                  child: Text(
                    "Read More",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
    );
  }
}
