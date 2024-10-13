import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A [Widget] that displays a loading indicator in a grid view layout.
///
/// The [Widget] uses the [Skeletonizer] package to display a loading
/// indicator for a [MasonryGridView] with 2 columns. The grid view displays
/// a list of 8 movie cards, with a 10-pixel gap between each card. The
/// movie cards are arranged in a staggered layout, meaning that the cards
/// in each row are arranged in a staggered pattern.
///
/// The movie cards display a placeholder image and a placeholder title.
/// The image is a 250x250-pixel image downloaded from the Astratic Blocks
/// website, and the title is a centered text with a font weight of 300
/// and an ellipsis overflow. The title is tapped to do nothing.
///
/// This [Widget] is used to display a loading indicator for the movie
/// list in the [MoviesListView] screen.
Widget gridViewLoader() {
  return Skeletonizer(
      enabled: true,
      child: MasonryGridView.builder(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 8,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 280,
                child: Column(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'id',
                        child: SizedBox(
                            height: 250,
                            child: Image.network(
                              'https://blocks.astratic.com/img/general-img-landscape.png',
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      'Movie',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          }));
}
