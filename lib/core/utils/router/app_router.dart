import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:basic_restaurant/features/app/presentation/pages/main_page.dart';
import 'package:basic_restaurant/features/home/presentation/pages/add_to_cart_page.dart';
import 'package:basic_restaurant/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutesName.homePage,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RoutesName.addToCartPage,
        builder: (context, state) => const AddToCartPage(),
      ),
      GoRoute(
        path: RoutesName.mainPage,
        builder: (context, state) => const MainPage(),
      ),
    ],
  );
}
