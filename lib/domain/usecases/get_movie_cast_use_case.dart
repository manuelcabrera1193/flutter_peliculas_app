import 'package:get/get.dart';
import 'package:peliculas_app/domain/models/models.dart';
import 'package:peliculas_app/domain/repository/movies_repository.dart';

class GetMovieCastUseCase extends GetxService {
  final MoviesRepository moviesRepository;

  GetMovieCastUseCase(this.moviesRepository);

  Future<CreditsResponse?> getMovieCast(int movieId) {
    return moviesRepository.getMovieCast(movieId);
  }
}
