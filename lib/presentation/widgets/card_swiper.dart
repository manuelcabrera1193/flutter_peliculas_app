import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import 'package:peliculas_app/presentation/providers/movies_controller.dart';
import 'package:peliculas_app/presentation/router/app_routes.dart';

class CardSwiperScreen extends GetWidget<MoviesController> {
  const CardSwiperScreen({
    Key? key,
    // required this.movies,
  }) : super(key: key);

  // final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(
      () => controller.onDisplayMovies.isEmpty
          ? SizedBox(
              width: double.infinity,
              height: size.height / 2,
              child: const Center(child: CircularProgressIndicator()),
            )
          : FadeInUpBig(
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  width: double.infinity,
                  height: size.height / 2,
                  child: Swiper(
                    itemCount: 10,
                    layout: SwiperLayout.STACK,
                    itemWidth: size.width * 0.6,
                    itemHeight: size.height * 0.9,
                    itemBuilder: (context, index) {
                      final movie = controller.onDisplayMovies[index];
                      movie.heroId = 'swiper-${movie.id}';
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.routes[0].route,
                          arguments: movie,
                        ),
                        child: Hero(
                          tag: movie.heroId!,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              placeholder:
                                  const AssetImage('assets/no-image.jpg'),
                              image: NetworkImage(
                                movie.fullPosterImg,
                              ),
                              //image: NetworkImage('https://via.placeholder.com/300x400'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
