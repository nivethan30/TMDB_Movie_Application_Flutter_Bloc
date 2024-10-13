import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';
import '../../../models/movie_list_model/movie_list_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../movie_view/movie_view.dart';

class CarouselWidget extends StatefulWidget {
  final List<MovieListModel> movies;
  const CarouselWidget({super.key, required this.movies});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  @override
  /// Returns a Column widget with a CarouselSlider widget as its first child and
  /// a DotsIndicator widget as its second child. The CarouselSlider widget is
  /// configured to display a list of movies as a carousel of cards. The cards
  /// are arranged in a 16:9 aspect ratio, with a margin of 10 on the bottom.
  /// The DotsIndicator widget is configured to display a row of dots that
  /// indicate the current page of the CarouselSlider. The dots are colored
  /// white and grey, and the active dot is larger than the inactive dots.
  /// The onTap callback is used to jump to a specific page of the CarouselSlider
  /// when the user taps on a dot.
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Expanded(
          child: CarouselSlider.builder(
              carouselController: _carouselSliderController,
              itemCount: widget.movies.length,
              itemBuilder: (context, index, realIndex) {
                MovieListModel movie = widget.movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieView(
                                  movieId: movie.id,
                                  randomId: 1,
                                )));
                  },
                  child: Hero(
                    tag: '${movie.id}-1',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: scWidth * 0.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            cacheManager: posterImageCacheManager,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, progress) {
                              return Center(
                                  child: CircularProgressIndicator(
                                value: progress.progress,
                              ));
                            },
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            imageUrl:
                                "https://image.tmdb.org/t/p/original/${movie.posterPath}"),
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
              )),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.maxFinite,
          child: DotsIndicator(
            onTap: (position) {
              setState(() {
                _currentIndex = position;
              });
              _carouselSliderController.jumpToPage(position);
            },
            dotsCount: widget.movies.length,
            position: _currentIndex,
            decorator: const DotsDecorator(
              activeColor: Colors.white,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: Colors.grey,
              size: Size(5, 5),
              activeSize: Size(12.0, 7.0),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
