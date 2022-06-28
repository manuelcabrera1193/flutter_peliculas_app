import 'package:get/get.dart';
import 'package:peliculas_app/data/utils/network_constants.dart';
import 'package:peliculas_app/domain/models/models.dart';

class MoviesService extends GetConnect {
  // bool flagInitBaseService = false;

  // Future<String> _getJsonData(String endpoint, [int page = 1]) async {
  //   try {
  //    if (!flagInitBaseService) {
  //       flagInitBaseService = config();
  //    }
  //     final $headers = {
  //       'api_key': NetworkConstants.apiKey,
  //       'language': NetworkConstants.language,
  //       'page': '$page',
  //     };
  //     final response =
  //         await get("${NetworkConstants.baseUrl}/$endpoint", headers: $headers);
  //     final code = response.statusCode ?? 0;
  //     print(response);
  //     if (code == 200) {
  //       return response.body;
  //     } else {
  //       return "";
  //     }
  //   } catch (e) {
  //     return "";
  //   }
  // }

  Future<List<Movie>> getOnDisplayMovies() async {
    try {
      print("getOnDisplayMovies Service init");
      final response = await get(
          "${NetworkConstants.baseUrl}/3/movie/now_playing?api_key=${NetworkConstants.apiKey}&language=en-US&page=1");
      print("getOnDisplayMovies Service response: ${response.statusCode}");
      print("getOnDisplayMovies Service response: ${response.body}");

      final code = response.statusCode ?? 0;
      if (code == 200) {
        if (response.body.isNotEmpty) {
          final nowPalyingResponse = NowPlayingResponse.fromMap(response.body);
          final listMovies = nowPalyingResponse.results;
          print("lista: ${listMovies.length}");
          return listMovies;
        } else {
          return <Movie>[];
        }
      } else {
        return <Movie>[];
      }
    } catch (e) {
      print("Error in getOnDisplayMovies: $e");
      return <Movie>[];
    }
  }

  Future<PopularReponse?> getPopularMovies(
      List<Movie> popularMovies, int page) async {
    try {
      print("getPopularMovies Service init");
      final response = await get(
          "https://api.themoviedb.org/3/movie/popular?api_key=0b3ca474b15685eea90750b378afa15f&language=en-US&page=1");
      print("getPopularMovies Service response: ${response.statusCode}");
      print("getPopularMovies Service response: ${response.body}");
      final code = response.statusCode ?? 0;
      if (code == 200) {
        if (response.body.isNotEmpty) {
          return PopularReponse.fromMap(response.body);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<CreditsResponse?> getMovieCast(int movieId) async {
    try {
      print("getMovieCast Service init");
      final response = await get(
          "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=0b3ca474b15685eea90750b378afa15f&language=en-US");
      print("getMovieCast Service response: ${response.statusCode}");
      print("getMovieCast Service response: ${response.body}");
      final code = response.statusCode ?? 0;
      if (code == 200) {
        if (response.body.isNotEmpty) {
          return CreditsResponse.fromMap(response.body);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    try {
      final response = await get(
        "https://api.themoviedb.org/3/search/movie?api_key=0b3ca474b15685eea90750b378afa15f&language=en-US&query=$query&page=1",
      );
      print("getPopularMovies Service response: ${response.statusCode}");
      print("getPopularMovies Service response: ${response.body}");
      final code = response.statusCode ?? 0;
      if (code == 200) {
        if (response.body.isNotEmpty) {
          final searchMoviesResponse =
              SearchMoviesResponse.fromMap(response.body);
          return searchMoviesResponse.results;
        } else {
          return <Movie>[];
        }
      } else {
        return <Movie>[];
      }
    } catch (e) {
      return <Movie>[];
    }
  }
}
