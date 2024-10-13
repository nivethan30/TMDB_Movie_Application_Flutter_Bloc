import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../models/movie_list_model/movie_list_model.dart';
import '../../../utils/constants.dart';
import '../../movie_view/movie_view.dart';

  /// A GridView widget that displays a list of movies as a grid of cards.
  ///
  /// The widget takes a list of movies, a random id, and a scroll controller
  /// as parameters. The list of movies is used to populate the grid, the
  /// random id is used to create a unique hero tag for each card, and the
  /// scroll controller is used to control the scrolling of the grid.
  ///
  /// When a card is tapped, the widget navigates to the [MovieView] screen,
  /// passing the movie id and the random id as parameters.
  ///
  /// The grid is arranged in a 2-column layout, with a 10-pixel gap between
  /// each card. The height of each card is fixed at 280 pixels, and the width
  /// is set to match the width of the screen. The cards are arranged in a
  /// staggered layout, meaning that the cards in each row are arranged in a
  /// staggered pattern.
  ///
  /// The widget uses the [CachedNetworkImage] widget to display the movie
  /// posters. The [posterImageCacheManager] is used to cache the images, and
  /// the [placeholder] and [errorWidget] properties are used to display a
  /// loading indicator and an error icon, respectively, while the image is
  /// loading.
  ///
Widget moviesGridView(
    {required List<MovieListModel> moviesList,
    required int randomId,
    required ScrollController scrollController}) {
  return MasonryGridView.builder(
      controller: scrollController,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        MovieListModel movie = moviesList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieView(
                        movieId: movie.id,
                        randomId: randomId,
                      )),
            );
          },
          child: SizedBox(
            height: 280,
            child: Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: '${movie.id}-$randomId',
                    child: SizedBox(
                      height: 250,
                      child: CachedNetworkImage(
                          cacheManager: posterImageCacheManager,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl:
                              "https://image.tmdb.org/t/p/original/${movie.posterPath}"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        );
      });
}
