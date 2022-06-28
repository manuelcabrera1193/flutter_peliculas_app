import 'package:get/get.dart';
import 'package:peliculas_app/domain/models/models.dart';
import 'package:peliculas_app/domain/repository/movies_repository.dart';

class SearchMoviesUseCase extends GetxService {
  final MoviesRepository moviesRepository;

  SearchMoviesUseCase(this.moviesRepository);

  Future<List<Movie>> searchMovies(String query) {
    return moviesRepository.searchMovies(query);
  }
}
