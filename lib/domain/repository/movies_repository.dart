import 'package:peliculas_app/domain/models/models.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getOnDisplayMovies();
  Future<PopularReponse?> getPopularMovies(List<Movie> popularMovies, int page);
  Future<CreditsResponse?> getMovieCast(int movieId);
  Future<List<Movie>> searchMovies(String query);
}
