import 'package:basic_restaurant/core/services/service_locator.dart';
import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:basic_restaurant/features/app/presentation/pages/main_page.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/auth_page.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/forget_password.dart';
import 'package:basic_restaurant/features/home/presentation/pages/add_to_cart_page.dart';
import 'package:basic_restaurant/features/home/presentation/pages/home_page.dart';
import 'package:basic_restaurant/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:basic_restaurant/features/splash/presentation/pages/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    redirect: (context, state) {
      final user = getIt<FirebaseAuth>().currentUser;

      final publicRoutes = {
        RoutesName.splash,
        RoutesName.onBoarding,
        RoutesName.auth,
        RoutesName.forgetPassword,
      };

      final isGoingToPublic = publicRoutes.contains(state.fullPath);

      if (user == null && !isGoingToPublic) {
        return RoutesName.auth;
      }

      if (user != null && state.fullPath == RoutesName.splash) {
        return RoutesName.mainPage;
      }

      return null;
    },
    routes: [
      GoRoute(
        name: RoutesName.home,
        path: RoutesName.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: RoutesName.splash,
        path: RoutesName.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: RoutesName.onBoarding,
        path: RoutesName.onBoarding,
        builder: (context, state) => const OnBoardingPage(),
      ),
      GoRoute(
        name: RoutesName.auth,
        path: RoutesName.auth,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        name: RoutesName.forgetPassword,
        path: RoutesName.forgetPassword,
        builder: (context, state) => const ForgetPassword(),
      ),
      GoRoute(
        path: RoutesName.addToCart,
        builder: (context, state) => const AddToCartPage(),
      ),
      GoRoute(
        name: RoutesName.mainPage,
        path: RoutesName.mainPage,
        builder: (context, state) => const MainPage(),
      ),
    ],
  );
}
