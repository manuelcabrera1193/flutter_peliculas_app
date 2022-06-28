import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas_app/domain/models/models.dart';
import 'package:peliculas_app/presentation/providers/movies_controller.dart';
import 'package:peliculas_app/presentation/router/app_routes.dart';
import 'package:peliculas_app/presentation/screens/screens.dart';

class MovieSliderScreen extends StatefulWidget {
  // final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSliderScreen({
    Key? key,
    // required this.movies,
    required this.onNextPage,
    this.title,
  }) : super(key: key);

  @override
  State<MovieSliderScreen> createState() => _MovieSliderScreenState();
}

class _MovieSliderScreenState extends State<MovieSliderScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          (scrollController.position.maxScrollExtent - 500)) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: GetBuilder<MoviesController>(
              init: MoviesController(),
              builder: (controllerMovies) => ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: controllerMovies.popularMovies.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.toNamed(DetailScreen.routerName,
                        arguments: controllerMovies.popularMovies[index]);
                  },
                  // Navigator.pushNamed(
                  //     context, DetailScreen.routerName,
                  //     arguments: controllerMovies.popularMovies[index]),
                  child: _MoviePoster(
                    movie: controllerMovies.popularMovies[index],
                    heroId:
                        '${DateTime.now().millisecondsSinceEpoch}-$index-${controllerMovies.popularMovies[index].id}',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
    required this.movie,
    required this.heroId,
  }) : super(key: key);

  final Movie movie;
  final String heroId;

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(
                    movie.fullPosterImg,
                  ),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
