import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/movie_model/movie_model.dart';
import '../../image_viewer/image_viewer.dart';

class ProductionCompanies extends StatelessWidget {
  final MovieModel movie;
  const ProductionCompanies({super.key, required this.movie});

  @override
  /// A horizontal list of production companies that worked on the movie.
  ///
  /// Each item in the list is a [GestureDetector] that displays a [CircleAvatar]
  /// with the logo of the production company. When the item is tapped, it will
  /// navigate to the [ImageViewerWidget] screen with the logo image.
  ///
  /// The list is arranged horizontally, and the items are centered vertically.
  /// The height of the list is fixed at 200 pixels, and the width is set to
  /// match the width of the screen.
  ///
  /// The [CachedNetworkImage] widget is used to load the logo images from the
  /// TMDB API. The [placeholder] and [errorWidget] properties are used to
  /// display a loading indicator and an error icon, respectively, while the
  /// image is loading.
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.productionCompanies.length,
          itemBuilder: (context, index) {
            ProductionCompany productionCompany =
                movie.productionCompanies[index];
            return GestureDetector(
              onTap: () {
                if (productionCompany.logoPath != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageViewerWidget(
                                imageUrl: productionCompany.logoPath,
                                backgroundColor: Colors.white,
                              )));
                }
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      minRadius: 50,
                      maxRadius: 50,
                      child: ClipOval(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://image.tmdb.org/t/p/original/${productionCompany.logoPath}",
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      productionCompany.name,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
