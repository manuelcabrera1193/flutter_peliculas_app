import 'package:get/instance_manager.dart';
import 'package:peliculas_app/data/repository_imp/movies_repository_imp.dart';
import 'package:peliculas_app/domain/usecases/get_movie_cast_use_case.dart';
import 'package:peliculas_app/domain/usecases/get_on_display_movies_use_case.dart';
import 'package:peliculas_app/domain/usecases/get_popular_movies_use_case.dart';
import 'package:peliculas_app/domain/usecases/search_movies_use_case.dart';
import 'package:peliculas_app/presentation/providers/movies_controller.dart';

class HomeBinding extends Bindings {
  final moviesRepository = MoviesRepositoryImp();

  @override
  void dependencies() {
    Get.lazyPut(() => GetMovieCastUseCase(moviesRepository), fenix: true);
    Get.lazyPut(() => GetOnDisplayMoviesUseCase(moviesRepository), fenix: true);
    Get.lazyPut(() => GetPopularMoviesUseCase(moviesRepository), fenix: true);
    Get.lazyPut(() => SearchMoviesUseCase(moviesRepository), fenix: true);
    Get.lazyPut(() => MoviesController(), fenix: true);
  }
}
