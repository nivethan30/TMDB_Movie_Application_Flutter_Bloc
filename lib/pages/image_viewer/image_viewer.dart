import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerWidget extends StatelessWidget {
  final String? imageUrl;
  final Color backgroundColor;
  const ImageViewerWidget(
      {super.key, required this.imageUrl, this.backgroundColor = Colors.black});

  @override
  /// Returns a Scaffold widget with a transparent AppBar and a CachedNetworkImage
  /// widget or a Text widget with a message 'No image available' if the imageUrl
  /// is null or empty. The CachedNetworkImage widget displays a loader while the
  /// image is being loaded and displays an error icon if the image can't be loaded.
  /// The image is displayed in a PhotoView widget with a minScale and maxScale set
  /// to PhotoViewComputedScale.contained and PhotoViewComputedScale.covered * 2
  /// respectively, and a background color set to the backgroundColor parameter.
  /// The foreground color of the AppBar is set to white if the backgroundColor
  /// is black, otherwise it is set to black. The Scaffold has its extendBodyBehindAppBar
  /// property set to true, and the AppBar has its elevation property set to 0.
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
