import 'package:get/get.dart';
import 'package:peliculas_app/presentation/bindings/home_binding.dart';
import 'package:peliculas_app/presentation/helpers/routes_app.dart';
import 'package:peliculas_app/presentation/screens/detail_screen.dart';
import 'package:peliculas_app/presentation/screens/home_screen.dart';
import 'package:peliculas_app/presentation/screens/not_found_screen.dart';

class PagesApp {
  static List<GetPage> screens = [
    GetPage(
      name: RoutesApp.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RoutesApp.home,
      page: () => const DetailScreen(),
      binding: HomeBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: RoutesApp.notFound,
      page: () => NotFoundScreen(),
      binding: HomeBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
  ];
}
