import 'package:basic_restaurant/core/services/service_locator.dart';
import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/auth_page.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/forget_password.dart';
import 'package:basic_restaurant/features/home/presentation/pages/home_page.dart';
import 'package:basic_restaurant/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:basic_restaurant/features/splash/presentation/pages/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
class AppRouter {
  static final router = GoRouter(
      // redirect: (context, state) {
      //   final user = getIt.get<FirebaseAuth>().currentUser;
      //   final loggingIn = state.fullPath == RoutesName.splash ||
      //       state.fullPath == RoutesName.onBoarding;

      //   if (user == null && !loggingIn) {
      //     return RoutesName.splash;
      //   }

      //   if (user != null && state.fullPath == RoutesName.splash) {
      //     return RoutesName.home;
      //   }

      //   return null;
      // },
      routes: [
        GoRoute(
            path: RoutesName.home,
            builder: (context, state) => const HomePage()),
        GoRoute(
            path: RoutesName.splash,
            builder: (context, state) => const SplashPage()),
        GoRoute(
            path: RoutesName.onBoarding,
            builder: (context, state) => const OnBoardingPage()),
        GoRoute(
            path: RoutesName.auth,
            builder: (context, state) => const AuthPage()),
        GoRoute(
            path: RoutesName.forgetPassword,
            builder: (context, state) => const ForgetPassword())
      ]);
}
