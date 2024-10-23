import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cast_details/cast_details_bloc.dart';
import '../../bloc/movie_details/movie_details_bloc.dart';
import '../../bloc/video_details/video_bloc.dart';
import '../../models/movie_model/movie_model.dart';
import '../../loader_widgets/movie_view_loader.dart';
import '../../utils/locators.dart';
import '../image_viewer/image_viewer.dart';
import 'widgets/cast_details.dart';
import 'widgets/collection_belong.dart';
import 'widgets/cover_image.dart';
import 'widgets/movie_view_error.dart';
import 'widgets/production_companies.dart';
import 'widgets/title_image_card.dart';
import 'widgets/video_details.dart';

class MovieView extends StatefulWidget {
  final int randomId;
  final int movieId;
  const MovieView({super.key, required this.movieId, required this.randomId});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override

  /// This method is called when the widget is inserted into the tree.
  ///
  /// It overrides the [State.initState] method and is used to initialize the
  /// objects that need to be initialized when the widget is inserted in the
  /// tree.
  ///
  /// In this case, it is used to fetch the movie details, cast details, and
  /// video details from the repository when the widget is inserted in the
  /// tree.
  void initState() {
    super.initState();
    locator<MovieDetailsBloc>().add(FetchMovieDetails(movieId: widget.movieId));
    locator<CastDetailsBloc>()
        .add(GetCastDetailsEvent(movieId: widget.movieId));
    locator<VideoBloc>().add(FetchVideoDetails(widget.movieId));
  }

  @override

  /// Builds the UI for the MovieView screen.
  ///
  /// Returns a [Scaffold] with a transparent [AppBar] and a body that is a 
  /// [BlocBuilder] listening to [MovieDetailsBloc]. 
  ///
  /// The body displays different UI components based on the state of 
  /// [MovieDetailsState]:
  /// - [MovieDetailsLoading]: Shows a loading indicator using [movieViewLoader].
  /// - [MovieDetailsError]: Shows an error message with a refresh option 
  ///   using [movieViewError].
  /// - [MovieDetailsFetched]: Displays movie details with a cover image, title, 
  ///   overview, videos, cast details, and production companies.
  ///
  /// The movie's backdrop image, title, and poster are shown in a [Stack]. 
  /// Additional movie information is displayed in a [SingleChildScrollView] 
  /// containing various widgets arranged in a [Column].
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
                    locator<MovieDetailsBloc>()
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
                                            name: movie.title,
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
                          if (VideoBloc.videos.isNotEmpty)
                            const Text(
                              'Videos',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          if (VideoBloc.videos.isNotEmpty)
                            VideoDetails(
                              movieId: movie.id,
                            ),
                          const SizedBox(height: 20),
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
