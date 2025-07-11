import 'package:blog_app/core/providers/post_provider.dart';
import 'package:blog_app/features/home/widgets/news_list.dart';
import 'package:blog_app/features/home/widgets/notifcation_icon.dart';
import 'package:blog_app/features/home/widgets/search_bar.dart';
import 'package:blog_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<dynamic> posts = [];
  // bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchInitialData(); // Fetch initial data when the widget is initialized
  }

  Future<void> fetchInitialData() async {
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    postProvider.setLoading(true); // Set loading state to true
    try {
      final data = await ApiServices().fetchAllNews();
      postProvider.setPosts(data); // Update global state with fetched data
    } catch (e) {
      debugPrint("Error fetching initial data: $e");
    } finally {
      postProvider.setLoading(false); // Set loading state to false
    }
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    void updatePosts(List<dynamic> newPosts) {
      postProvider.setPosts(newPosts); // Update global state
    }

    void updateLoadingState(bool loadingState) {
      setState(() {
        postProvider.setLoading(loadingState);
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      debugPrint("Home");
                    },
                    icon: Icon(Icons.menu, size: 30),
                  ),
                  NotificationIcon(),
                ],
              ),
              HomeSearchBar(
                onDataFetched: updatePosts,
                onLoadingStateChanged: updateLoadingState,
              ),

              postProvider.isLoading
                  ? Center(
                    heightFactor: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                  : Expanded(
                    child:
                        postProvider.posts.isEmpty
                            ? Center(child: Text("No Data Available"))
                            : NewsList(posts: postProvider.posts),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
