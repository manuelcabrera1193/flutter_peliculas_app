import 'package:get/get.dart';
import 'package:peliculas_app/domain/models/models.dart';
import 'package:peliculas_app/domain/repository/movies_repository.dart';

class GetPopularMoviesUseCase extends GetxService {
  final MoviesRepository moviesRepository;

  GetPopularMoviesUseCase(this.moviesRepository);

  Future<PopularReponse?> getPopularMovies(
    List<Movie> popularMovies,
    int page,
  ) {
    return moviesRepository.getPopularMovies(popularMovies, page);
  }
}
