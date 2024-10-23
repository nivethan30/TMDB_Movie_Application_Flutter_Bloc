import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/top_rated_movies/top_rated_bloc.dart';
import '../../utils/constants.dart';
import '../../loader_widgets/list_view_loader.dart';
import '../../utils/locators.dart';
import '../movies_list/movies_list_view.dart';
import 'widgets/error_home_widget.dart';
import 'widgets/list_view_widget.dart';
import 'widgets/title_button.dart';

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({super.key});

  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  late TopRatedBloc _topRatedBloc;
  final ScrollController _topRatedScrollController = ScrollController();

  @override
  /// This method is called when the widget is inserted into the tree.
  ///
  /// It gets the [TopRatedBloc] from the context and adds the
  /// [FetchTopRatedMovies] event to the bloc if the state of the bloc
  /// is [TopRatedInitial] or [TopRatedFetchError].
  ///
  /// It also sets up the [_listenScrollActivity] method as a listener for
  /// the [_topRatedScrollController].
  ///
  /// This is a mandatory method for the [StatefulWidget] class.
  void initState() {
    super.initState();
    _topRatedBloc = locator<TopRatedBloc>();
    if (_topRatedBloc.state is TopRatedInitial ||
        _topRatedBloc.state is TopRatedFetchError) {
      _topRatedBloc.add(FetchTopRatedMovies());
    }
    _listenScrollActivity();
  }

  /// This method adds a listener to the [_topRatedScrollController] to check if
  /// the scroll position has reached the end of the scrollable area. If it has,
  /// and the state of [_topRatedBloc] is [TopRatedFetched], then it adds a new
  /// [FetchTopRatedMovies] event to [_topRatedBloc]. This will trigger the bloc
  /// to fetch more movies.
  void _listenScrollActivity() {
    _topRatedScrollController.addListener(() {
      if (_topRatedScrollController.position.pixels ==
          _topRatedScrollController.position.maxScrollExtent) {
        if (_topRatedBloc.state is TopRatedFetched) {
          _topRatedBloc.add(FetchTopRatedMovies());
        }
      }
    });
  }

  @override
  /// This method builds the UI for the top rated movies section of the home page.
  ///
  /// It returns a [BlocBuilder] widget that listens to the state of the
  /// [TopRatedBloc]. If the state is [TopRatedFetchLoading], it shows a
  /// [listViewLoader]. If the state is [TopRatedFetchError], it shows an
  /// [ErrorHomeWidget] with the error message and a [TextButton] to retry.
  /// If the state is [TopRatedFetched], it shows a [Column] with a
  /// [titleButtonRow] and a [ListViewWidget] of the top rated movies.
  ///
  /// The [ListViewWidget] shows a list of movies with a fixed height of 280 and
  /// a horizontal scroll direction. If the user taps on a movie, it navigates
  /// to the [MoviesListView] with the title of the movie and the movies list.
  ///
  /// If the state is any other state, it returns a [SizedBox] with height and
  /// width of 0.
  Widget build(BuildContext context) {
    String title = "Top Rated Movies";
    return BlocBuilder<TopRatedBloc, TopRatedState>(builder: (context, state) {
      if (state is TopRatedFetchLoading) {
        return SizedBox(height: 280, child: listViewLoader());
      } else if (state is TopRatedFetchError) {
        return ErrorHomeWidget(
          title,
          state.error,
          onRefresh: () {
            locator<TopRatedBloc>().add(RefreshTopRatedMovies());
          },
        );
      } else if (state is TopRatedFetched) {
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
                                moviesList: state.topRatedMovies,
                                controller: _topRatedScrollController,
                                bloc: _topRatedBloc,
                              )));
                }),
            SizedBox(
                height: 280,
                child: ListViewWidget(
                  movies: getSubList(state.topRatedMovies),
                  randomId: 2,
                )),
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
