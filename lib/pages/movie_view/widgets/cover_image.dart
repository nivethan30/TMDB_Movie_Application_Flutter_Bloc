import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Builds a [SizedBox] with a [CachedNetworkImage] as its child.
///
/// The [CachedNetworkImage] is used to display a movie poster image.
///
/// The [imagePath] parameter is used to specify the path of the image
/// to be displayed. The [scHeight] and [scWidth] parameters are used to
/// specify the height and width of the [SizedBox] respectively.
///
/// The [CachedNetworkImage] is configured to use the `BoxFit.cover`
/// strategy to scale the image to fit the [SizedBox].
///
/// A [CircularProgressIndicator] is used as the placeholder widget
/// until the image is loaded, and an [Icon] of [Icons.error] is used
/// as the error widget if the image fails to load.
Widget coverImage(
    {String? imagePath, required double scHeight, required double scWidth}) {
  return SizedBox(
    height: scHeight * 0.3,
    width: scWidth,
    child: CachedNetworkImage(
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageUrl: "https://image.tmdb.org/t/p/original/$imagePath"),
  );
}
