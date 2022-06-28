import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas_app/domain/models/models.dart';
import 'package:peliculas_app/presentation/providers/movies_controller.dart';
// import 'package:provider/provider.dart';

class CastingcardsScreen extends GetView<MoviesController> {
  const CastingcardsScreen({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    // final moviesProvider = Provider.of<MoviesController>(context, listen: false);

    return FutureBuilder(
      future: controller.getMovieCast(movieId),
      builder: (context, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
              constraints: BoxConstraints(maxWidth: 150),
              height: 180,
              child: CupertinoActivityIndicator());
        }

        final List<Cast> data = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(
            bottom: 30,
          ),
          width: double.infinity,
          height: 180,
          // color: Colors.red,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _CastCard(actor: data[index]);
            },
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key, required this.actor}) : super(key: key);

  final Cast actor;

  @override
  Widget build(BuildContext context) {
    return FadeInDownBig(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        width: 110,
        height: 100,
        // color: Colors.green,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(
                  actor.fullProfilePath,
                ),
                height: 140,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              actor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
