import 'package:go_router/go_router.dart';
import 'package:sample_app/presentation_layer/cart_list_page/cart_list_page.dart';
import 'package:sample_app/presentation_layer/main_page.dart';
import 'package:sample_app/presentation_layer/splash_page/splash_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/cart-list',
      name: 'cart-list',
      builder: (context, state) => const CartListPage(),
    ),
  ],
);
