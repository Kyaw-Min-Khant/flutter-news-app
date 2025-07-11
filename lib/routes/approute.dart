import 'package:blog_app/features/home/view/home.dart';
import 'package:blog_app/features/login/view/login.dart';
import 'package:blog_app/features/new/view/new.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final approuter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name:
          'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => Home(),
    ),
    GoRoute(
      name: 'news',
      path: '/news',
      builder: (context, state) {
        final post = state.extra as Map<String, dynamic>;
        return New(post: post);
      },
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => Login(),
    ),
  ],
);
