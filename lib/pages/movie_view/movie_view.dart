import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cast_details/cast_details_bloc.dart';
import '../../bloc/movie_details/movie_details_bloc.dart';
import '../../models/movie_model/movie_model.dart';
import '../../loader_widgets/movie_view_loader.dart';
import '../image_viewer/image_viewer.dart';
import 'widgets/cast_details.dart';
import 'widgets/collection_belong.dart';
import 'widgets/cover_image.dart';
import 'widgets/movie_view_error.dart';
import 'widgets/production_companies.dart';
import 'widgets/title_image_card.dart';

class MovieView extends StatefulWidget {
  final int randomId;
  final int movieId;
  const MovieView({super.key, required this.movieId, required this.randomId});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  /// This method is called when the widget is inserted into the tree. It
  /// fetches the movie details and the movie cast from the server.
  ///
  /// The [MovieDetailsBloc] is used to fetch the movie details. The
  /// [FetchMovieDetails] event is added to the bloc with the movie ID
  /// passed as a parameter.
  ///
  /// The [CastDetailsBloc] is used to fetch the movie cast. The
  /// [GetCastDetailsEvent] event is added to the bloc with the movie ID
  /// passed as a parameter.
  void initState() {
    super.initState();
    BlocProvider.of<MovieDetailsBloc>(context)
        .add(FetchMovieDetails(movieId: widget.movieId));
    BlocProvider.of<CastDetailsBloc>(context)
        .add(GetCastDetailsEvent(movieId: widget.movieId));
  }

  @override
  /// This method builds a [Scaffold] that displays a [Container] with a black
  /// background and a [SingleChildScrollView] as its child.
  ///
  /// The [SingleChildScrollView] is used to display the movie details with
  /// a [Stack] that contains a [coverImage] and a [titleImagePosterRow] as its
  /// children. The [coverImage] displays the movie backdrop image and the
  /// [titleImagePosterRow] displays the movie title, overview, release date
  /// and poster image.
  ///
  /// The [SingleChildScrollView] also contains a [Column] that displays the
  /// movie cast details, production companies, and the genres as a [Text].
  ///
  /// The [Column] is padded with a [Padding] widget to provide a margin of 10
  /// pixels on both sides of the screen.
  ///
  /// The [Scaffold] is extended behind the appbar to provide a seamless
  /// transition between the appbar and the body of the screen. The appbar
  /// is transparent and has a foreground color of white. The appbar elevation
  /// is set to 0 to provide a seamless transition between the appbar and the
  /// body of the screen.
  Widget build(BuildContext context) {
    double scHeight = MediaQuery.of(context).size.height;
    double scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return movieViewLoader(scHeight, scWidth);
          } else if (state is MovieDetailsError) {
            return Center(
              child: movieViewError(
                  error: state.error,
                  onRefresh: () {
                    BlocProvider.of<MovieDetailsBloc>(context)
                        .add(FetchMovieDetails(movieId: widget.movieId));
                  }),
            );
          } else if (state is MovieDetailsFetched) {
            MovieModel movie = state.movie;
            String genres = state.movie.genres.map((e) => e.name).join(", ");
            return Container(
              height: scHeight,
              color: Colors.black12,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: scHeight * 0.6,
                      width: scWidth,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (movie.backdropPath != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ImageViewerWidget(
                                            imageUrl: movie.backdropPath!)));
                              }
                            },
                            child: coverImage(
                                imagePath: movie.backdropPath,
                                scHeight: scHeight,
                                scWidth: scWidth),
                          ),
                          Positioned(
                              top: scHeight * 0.27,
                              child: titleImagePosterRow(context,
                                  movie: movie,
                                  scHeight: scHeight,
                                  scWidth: scWidth,
                                  genres: genres,
                                  randomId: widget.randomId)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (movie.belongsToCollection != null)
                            collectionBelong(context, scWidth, movie),
                          if (movie.belongsToCollection != null)
                            const SizedBox(height: 20),
                          const Text(
                            'Overview',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            movie.overview,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Cast Details',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          CastDetails(
                            movieId: widget.movieId,
                          ),
                          const Text(
                            'Production Companies',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          ProductionCompanies(movie: movie)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
