import 'package:get/get.dart';
import 'package:peliculas_app/domain/models/models.dart';
import 'package:peliculas_app/domain/repository/movies_repository.dart';

class GetOnDisplayMoviesUseCase extends GetxService {
  final MoviesRepository moviesRepository;

  GetOnDisplayMoviesUseCase(this.moviesRepository);

  Future<List<Movie>> getOnDisplayMovies() async {
    print("GetOnDisplayMoviesUseCase getOnDisplayMovies");
    return await moviesRepository.getOnDisplayMovies();
  }
}
