
import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:basic_restaurant/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router=GoRouter(

    routes: [
    GoRoute(path: RoutesName.home, builder: (context, state) =>  const HomePage())
    
  ]
  );
}