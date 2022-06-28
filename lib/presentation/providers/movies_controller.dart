import 'dart:async';

import 'package:get/get.dart';
import 'package:peliculas_app/domain/models/models.dart';
import 'package:peliculas_app/domain/usecases/get_movie_cast_use_case.dart';
import 'package:peliculas_app/domain/usecases/get_on_display_movies_use_case.dart';
import 'package:peliculas_app/domain/usecases/get_popular_movies_use_case.dart';
import 'package:peliculas_app/domain/usecases/search_movies_use_case.dart';
import 'package:peliculas_app/presentation/helpers/debouncer.dart';

class MoviesController extends GetxController {
  var onDisplayMovies = <Movie>[].obs;
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  final getMovieCastUseCase = Get.find<GetMovieCastUseCase>();
  final getOnDisplayMoviesUseCase = Get.find<GetOnDisplayMoviesUseCase>();
  final getPopularMoviesUseCase = Get.find<GetPopularMoviesUseCase>();
  final searchMoviesUseCase = Get.find<SearchMoviesUseCase>();

  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
    onValue: (value) {},
  );

  final StreamController<List<Movie>> _suggestionsStreamController =
      new StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream =>
      _suggestionsStreamController.stream;

  void getOnDisplayMovies() async {
    final result = await getOnDisplayMoviesUseCase.getOnDisplayMovies();
    onDisplayMovies(result);
    //update();
  }

  void getPopularMovies() async {
    _popularPage++;
    final popularResponse = await getPopularMoviesUseCase.getPopularMovies(
      popularMovies,
      _popularPage,
    );
    if (popularResponse != null) {
      popularMovies = [...popularMovies, ...popularResponse.results];
      update();
    }
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    final creditsResponse = await getMovieCastUseCase.getMovieCast(movieId);
    if (creditsResponse != null) {
      moviesCast[movieId] = creditsResponse.cast;
      return creditsResponse.cast;
    } else {
      return <Cast>[];
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    return searchMoviesUseCase.searchMovies(query);
  }

  void getSuggestionByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovies(value.toString());
      _suggestionsStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });
    Future.delayed(
      const Duration(
        milliseconds: 300,
      ),
    ).then((_) => timer.cancel());
  }

  @override
  void onInit() {
    getOnDisplayMovies();
    getPopularMovies();
    super.onInit();
  }
}
