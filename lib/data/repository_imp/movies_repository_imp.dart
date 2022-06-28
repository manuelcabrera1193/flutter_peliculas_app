import 'package:peliculas_app/data/services/movies_services.dart';
import 'package:peliculas_app/domain/models/popular_response.dart';
import 'package:peliculas_app/domain/models/movie.dart';
import 'package:peliculas_app/domain/models/credits_response.dart';
import 'package:peliculas_app/domain/repository/movies_repository.dart';

class MoviesRepositoryImp extends MoviesRepository {
  final moviesService = MoviesService();

  @override
  Future<CreditsResponse?> getMovieCast(int movieId) {
    return moviesService.getMovieCast(movieId);
  }

  @override
  Future<List<Movie>> getOnDisplayMovies() {
    print("MoviesRepositoryImp getOnDisplayMovies");
    return moviesService.getOnDisplayMovies();
  }

  @override
  Future<PopularReponse?> getPopularMovies(
      List<Movie> popularMovies, int page) {
    return moviesService.getPopularMovies(popularMovies, page);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return moviesService.searchMovies(query);
  }
}
