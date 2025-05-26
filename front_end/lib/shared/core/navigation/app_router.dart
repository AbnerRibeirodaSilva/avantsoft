import 'package:go_router/go_router.dart';

import '../../../modules/auth/presenter/view/sign_in_view.dart';
import '../../../modules/home/presenter/view/home_navigation.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const SignInView()),
    GoRoute(path: '/home', builder: (context, state) => const HomeNavigation()),
  ],
);
