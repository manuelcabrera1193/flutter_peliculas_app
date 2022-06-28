import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas_app/presentation/helpers/main_bindings.dart';
import 'package:peliculas_app/presentation/helpers/pages_app.dart';
import 'package:peliculas_app/presentation/helpers/routes_app.dart';
import 'package:peliculas_app/presentation/router/app_routes.dart';
import 'package:peliculas_app/presentation/theme/app_theme.dart';
void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: RoutesApp.home,
      getPages: PagesApp.screens,
      initialBinding: MainBindings(),
    );
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) => MoviesProvider(),
    //       lazy: false,
    //     ),
    //   ],
    //   child: MyApp(),
    // );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.lighTheme,
    );
  }
}
