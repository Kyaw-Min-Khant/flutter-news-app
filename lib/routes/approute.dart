import 'package:blog_app/features/home/view/home.dart';
import 'package:blog_app/features/login/view/login.dart';
import 'package:blog_app/features/new/view/new.dart';
import 'package:blog_app/features/profile/view/profile.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final approuter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name:
          'home',
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
    GoRoute(path: '/profile',name:'profile',builder: (context,state)=> Profile())
  ],
);
