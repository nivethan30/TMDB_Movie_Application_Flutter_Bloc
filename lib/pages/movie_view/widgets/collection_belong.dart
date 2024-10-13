import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/movie_model/movie_model.dart';
import '../../image_viewer/image_viewer.dart';

/// Displays a [CircleAvatar] with the backdrop image of a movie's collection,
/// and a [Text] widget with the collection's name.
///
/// The [CircleAvatar] is a [GestureDetector] that navigates to [ImageViewerWidget]
/// with the backdrop image when tapped.
///
/// The [Text] widget shows "Belongs to" followed by the collection's name, and
/// is centered horizontally and vertically within its parent.
///
/// The widget is wrapped in a [Container] with a vertical margin of 10.
/// The height of the [Container] is set to 100, and the width is set to
/// [double.infinity].
///
Widget collectionBelong(
    BuildContext context, double scWidth, MovieModel movie) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    height: 100,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.values[5],
      children: [
        GestureDetector(
          onTap: () {
            if (movie.belongsToCollection!.backdropPath != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageViewerWidget(
                          imageUrl: movie.belongsToCollection!.backdropPath)));
            }
          },
          child: CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500${movie.belongsToCollection!.backdropPath}",
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: scWidth * 0.5,
          child: Text(
            "Belongs to \n ${movie.belongsToCollection!.name}",
            textAlign: TextAlign.center,
            maxLines: 4,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
