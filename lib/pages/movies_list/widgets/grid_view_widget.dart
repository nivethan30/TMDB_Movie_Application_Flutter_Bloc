import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../models/movie_list_model/movie_list_model.dart';
import '../../../utils/constants.dart';
import '../../movie_view/movie_view.dart';

/// A [Widget] that displays a grid view of movies with their posters and titles.
///
/// The [Widget] takes a list of [MovieListModel] as its first parameter, an
/// [int] random id as its second parameter, a [bool] indicating whether the
/// movies are loading as its third parameter, and a [ScrollController] as its
/// fourth parameter.
///
/// The [Widget] displays a [MasonryGridView] with a fixed number of columns
/// (2) and a dynamic number of rows. The [MasonryGridView] displays a movie
/// poster and title for each movie in the list. The poster is displayed in
/// a [Hero] widget with a tag that is a concatenation of the movie id and
/// the random id. This allows the poster image to be transitioned when the
/// user navigates to the movie details screen.
///
/// The movie title is displayed below the poster image, centered and with
/// a font weight of 300. The title is tapped to navigate to the movie
/// details screen with the movie id and random id passed as parameters.
///
/// If the movies are loading, a [CircularProgressIndicator] is displayed at
/// the bottom of the [Widget].
///
/// This [Widget] is used in the [MoviesListView] screen to display the movies
/// in a grid view. The [MoviesListView] screen is used to display the movies
/// in a list view.
Widget moviesGridView(
    {required List<MovieListModel> moviesList,
    required int randomId,
    required bool isLoading,
    required ScrollController scrollController}) {
  return Column(
    children: [
      Expanded(
        child: MasonryGridView.builder(
            shrinkWrap: true,
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
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
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
            }),
      ),
      if (isLoading)
        const Center(
          child: CircularProgressIndicator(),
        )
    ],
  );
}
