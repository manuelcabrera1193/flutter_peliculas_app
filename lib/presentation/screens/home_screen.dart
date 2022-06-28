import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas_app/presentation/providers/movies_controller.dart';
import 'package:peliculas_app/presentation/search/search_delegate.dart';
import 'package:peliculas_app/presentation/widgets/card_swiper.dart';
import 'package:peliculas_app/presentation/widgets/movie_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routerName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    //final moviesProvider = Provider.of<MoviesProvider>(context);
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
                  //movies: moviesProvider.onDisplayMovies,
                  ),
              //Slider de Peliculas
              MovieSliderScreenTitleView(),
              MovieSliderScreenDetail(),
              MovieSliderScreenDetail(),
              MovieSliderScreenTitleView(),
            ],
          ),
        ));
  }
}

class MovieSliderScreenTitleView extends GetWidget<MoviesController> {
  const MovieSliderScreenTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieSliderScreen(
      title: "Popular",
      // movies: controller.popularMovies,
      onNextPage: () => controller.getPopularMovies(),
    );
  }
}

class MovieSliderScreenDetail extends GetView<MoviesController> {
  MovieSliderScreenDetail({
    Key? key,
  }) : super(key: key);

  String? title;

  @override
  Widget build(BuildContext context) {
    return MovieSliderScreen(
      // movies: controller.popularMovies,
      onNextPage: () => controller.getPopularMovies(),
    );
  }
}
