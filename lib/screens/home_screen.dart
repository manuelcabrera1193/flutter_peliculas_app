import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MovieSearchDelegate());
              },
              icon: const Icon(Icons.search_outlined),
            )
          ],
          title: const Center(
            child: Text('Peliculas'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Cards
              CardSwiperScreen(
                movies: moviesProvider.onDisplayMovies,
              ),
              //Slider de Peliculas
              MovieSliderScreen(
                title: 'Popular',
                movies: moviesProvider.popularMovies,
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
              MovieSliderScreen(
                movies: moviesProvider.popularMovies,
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
              MovieSliderScreen(
                movies: moviesProvider.popularMovies,
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
              MovieSliderScreen(
                title: 'Popular',
                movies: moviesProvider.popularMovies,
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
