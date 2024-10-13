import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';
import '../../../models/movie_list_model/movie_list_model.dart';
import '../../movie_view/movie_view.dart';

class ListViewWidget extends StatelessWidget {
  final List<MovieListModel> movies;
  final int randomId;
  const ListViewWidget(
      {super.key, required this.movies, required this.randomId});

  @override
  /// Returns a [ListView] widget that displays a horizontal list of movies
  /// with posters and titles. The list is infinite and the user can scroll
  /// horizontally to view more movies.
  ///
  /// When a movie is tapped, the user is navigated to the [MovieView] screen
  /// with the movie id and random id passed as parameters.
  ///
  /// The [ListView] is wrapped in a [Hero] widget with a tag that is a
  /// concatenation of the movie id and a random id. This allows the poster
  /// image to be transitioned when the user navigates to the movie details
  /// screen.
  ///
  /// The [CachedNetworkImage] widget is used to display the movie poster
  /// image. The [posterImageCacheManager] is used to cache the images, and
  /// the [placeholder] and [errorWidget] properties are used to display a
  /// loading indicator and an error icon, respectively, while the image is
  /// loading.
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          MovieListModel movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieView(
                            movieId: movie.id,
                            randomId: randomId,
                          )));
            },
            child: Hero(
              tag: '${movie.id}-$randomId',
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          cacheManager: posterImageCacheManager,
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                          progressIndicatorBuilder: (context, url, progress) {
                            return Center(
                                child: CircularProgressIndicator(
                              value: progress.progress,
                            ));
                          },
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )),
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
