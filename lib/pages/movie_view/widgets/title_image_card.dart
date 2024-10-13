import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/movie_model/movie_model.dart';
import '../../../utils/constants.dart';
import '../../image_viewer/image_viewer.dart';

/// A row that displays a movie's title and image poster.
///
/// The image poster is displayed on the left side of the row, and the title,
/// release date, genres, vote average, budget, and revenue are displayed on
/// the right side of the row.
///
/// The image poster is wrapped in a [Hero] widget with a tag that is a
/// concatenation of the movie id and a random id. This allows the image
/// poster to be transitioned when the user navigates to the movie details
/// screen.
///
/// The image poster is also wrapped in a [GestureDetector] widget that
/// navigates to the [ImageViewerWidget] when the user taps on the image.
///
/// The row is returned as the child of a [Column] widget in the [MovieView]
/// screen.
Widget titleImagePosterRow(BuildContext context,
    {required MovieModel movie,
    required double scHeight,
    required double scWidth,
    required String genres,
    required int randomId}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          if (movie.posterPath != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ImageViewerWidget(imageUrl: movie.posterPath!)));
          }
        },
        child: Hero(
          tag: '${movie.id}-$randomId',
          child: titleImageCard(scHeight, scWidth, movie.posterPath),
        ),
      ),
      SizedBox(
        height: scHeight * 0.3,
        width: scWidth * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              movie.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(formatDate(movie.releaseDate)),
            Text(
              genres,
              style: const TextStyle(fontSize: 14),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 18,
                ),
                Text("${movie.voteAverage.toStringAsFixed(1)} / 10"),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Budget: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${movie.budget}',
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  'Revenue: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${movie.revenue}',
                  style: const TextStyle(fontSize: 14),
                )
              ],
            )
          ],
        ),
      )
    ],
  );
}

/// Builds a [Container] with a [CachedNetworkImage] as its child.
///
/// The [CachedNetworkImage] is used to display a movie poster image.
///
/// The [imagePath] parameter is used to specify the path of the image
/// to be displayed. The [scHeight] and [scWidth] parameters are used to
/// specify the height and width of the [Container] respectively.
///
/// The [CachedNetworkImage] is configured to use the `BoxFit.cover`
/// strategy to scale the image to fit the [Container]. The image is loaded
/// from the path specified in the [imagePath] parameter, and the
/// [posterImageCacheManager] is used to cache the image.
///
/// A [CircularProgressIndicator] is used as the placeholder widget
/// until the image is loaded, and an [Icon] of [Icons.error] is used
/// as the error widget if the image fails to load.
Widget titleImageCard(double scHeight, double scWidth, String? imagePath) {
  return Container(
    padding: const EdgeInsets.all(10),
    height: scHeight * 0.3,
    width: scWidth * 0.4,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
          cacheManager: posterImageCacheManager,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageUrl: "https://image.tmdb.org/t/p/original/$imagePath"),
    ),
  );
}
