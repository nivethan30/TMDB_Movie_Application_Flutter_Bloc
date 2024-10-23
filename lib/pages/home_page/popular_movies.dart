import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/popular_movies/popular_bloc.dart';
import '../../utils/constants.dart';
import '../../loader_widgets/carousel_loader.dart';
import '../../utils/locators.dart';
import '../movies_list/movies_list_view.dart';
import 'widgets/caousel_widget.dart';
import 'widgets/error_home_widget.dart';
import 'widgets/title_button.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  late PopularBloc _popularBloc;
  final ScrollController _popularMoviesScrollController = ScrollController();
  @override

  /// This method is called when the widget is inserted into the tree. It
  /// initializes the [_popularBloc] field with the bloc provided by
  /// the parent widget, and it also fetches the movies from the
  /// repository if the bloc is either in the initial state or
  /// in an error state. After that, it sets up the [_listenScrollActivity]
  /// method as a listener for the [_popularMoviesScrollController].
  ///
  /// This is a mandatory method for the [StatefulWidget] class.
  void initState() {
    _popularBloc = locator<PopularBloc>();
    if (_popularBloc.state is PopularMoviesInitial ||
        _popularBloc.state is PopularFetchError) {
      _popularBloc.add(FetchPopularMovies());
    }
    _listenScrollActivity();
    super.initState();
  }

  /// This method adds a listener to the [_popularMoviesScrollController] to
  /// check if the scroll position has reached the end of the scrollable area.
  /// If it has, and the state of [_popularBloc] is [PopularMoviesFetched], then
  /// it adds a new [FetchPopularMovies] event to [_popularBloc] to trigger the
  /// bloc to fetch more movies.
  void _listenScrollActivity() {
    _popularMoviesScrollController.addListener(() {
      if (_popularMoviesScrollController.position.pixels ==
          _popularMoviesScrollController.position.maxScrollExtent) {
        if (_popularBloc.state is PopularMoviesFetched) {
          _popularBloc.add(FetchPopularMovies());
        }
      }
    });
  }

  @override

  /// This method builds the UI for the popular movies widget. It
  /// returns a [BlocBuilder] widget that listens to the
  /// [PopularBloc] and builds the UI based on the state of the
  /// bloc. If the state is [PopularFetchLoading], it shows a
  /// [carouselSliderLoader] widget. If the state is
  /// [PopularFetchError], it shows a [ErrorHomeWidget] with the
  /// title 'Popular Movies', the error message, and a refresh
  /// button. If the state is [PopularMoviesFetched], it shows a
  /// [Column] widget with a [titleButtonRow] and a [CarouselWidget]
  /// with the list of popular movies. If the state is not any of
  /// these states, it returns a [SizedBox] widget with a height of
  /// 0.
  Widget build(BuildContext context) {
    double scHeight = MediaQuery.sizeOf(context).height;
    String title = "Popular Movies";
    return BlocBuilder<PopularBloc, PopularState>(builder: (context, state) {
      if (state is PopularFetchLoading) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: scHeight * 0.4,
            width: double.infinity,
            child: carouselSliderLoader());
      } else if (state is PopularFetchError) {
        return ErrorHomeWidget(
          title,
          state.error,
          onRefresh: () {
            locator<PopularBloc>().add(RefreshPopularMovies());
          },
        );
      } else if (state is PopularMoviesFetched) {
        return Column(
          children: [
            titleButtonRow(
                title: title,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoviesListView(
                                title: title,
                                moviesList: state.popularMovies,
                                controller: _popularMoviesScrollController,
                                bloc: _popularBloc,
                              )));
                }),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: scHeight * 0.4,
                width: double.infinity,
                child: CarouselWidget(
                  movies: getSubList(state.popularMovies),
                )),
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
