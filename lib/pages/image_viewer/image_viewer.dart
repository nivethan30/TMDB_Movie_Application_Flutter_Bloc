import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerWidget extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final Color backgroundColor;
  const ImageViewerWidget(
      {super.key, required this.imageUrl, this.backgroundColor = Colors.black, required this.name});

  @override

  /// Builds a [Scaffold] that displays an image in a [PhotoView].
  ///
  /// If [imageUrl] is null or empty, a [Center] widget with a [Text] widget
  /// displaying "No image available" is used instead.
  ///
  /// The image is loaded from the path specified in [imageUrl] from the
  /// [TMDB] server.
  ///
  /// The [AppBar] displays the [name] of the movie, and the foreground color
  /// is adjusted based on the [backgroundColor] of the [Scaffold].
  ///
  /// The [PhotoView] is configured to use the [backgroundColor] of the
  /// [Scaffold] as its background color, and the image is scaled to fit the
  /// [PhotoView] using the [PhotoViewComputedScale.contained] strategy. The
  /// image can be zoomed up to twice its original size using the
  /// [PhotoViewComputedScale.covered] * 2 strategy.
  ///
  /// A [CircularProgressIndicator] is used as the placeholder widget until
  /// the image is loaded, and an [Icon] of [Icons.error] is used as the error
  /// widget if the image fails to load.
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('No image available'),
        ),
      );
    }
    String url = "https://image.tmdb.org/t/p/original/${imageUrl ?? ''}";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(name),
        foregroundColor:
            backgroundColor == Colors.black ? Colors.white : Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: url,
          imageBuilder: (context, imageProvider) => PhotoView(
            backgroundDecoration: BoxDecoration(color: backgroundColor),
            imageProvider: imageProvider,
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
