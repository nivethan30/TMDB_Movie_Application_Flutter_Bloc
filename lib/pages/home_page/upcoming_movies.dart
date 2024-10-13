import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/upcoming_movies/upcoming_bloc.dart';
import '../../utils/constants.dart';
import '../../loader_widgets/list_view_loader.dart';
import '../movies_list/movies_list_view.dart';
import 'widgets/error_home_widget.dart';
import 'widgets/list_view_widget.dart';
import 'widgets/title_button.dart';

class UpcomingMovies extends StatefulWidget {
  const UpcomingMovies({super.key});

  @override
  State<UpcomingMovies> createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  late UpcomingBloc _upcomingBloc;
  final ScrollController _upcomingMoviesScrollController = ScrollController();

  @override
  /// This method is called when the object is inserted into the tree.
  ///
  /// It overrides the [State.initState] method and is used to initialize the
  /// objects that need to be initialized when the widget is inserted in the
  /// tree.
  ///
  /// In this case, it is used to fetch the upcoming movies from the server if
  /// the state of the [_upcomingBloc] is either [UpcomingInitial] or
  /// [UpcomingFetchError]. It also sets up the [_listenScrollActivity] method
  /// as a listener for the [_upcomingMoviesScrollController].
  ///
  /// This is a mandatory method for the [StatefulWidget] class.
  void initState() {
    super.initState();
    _upcomingBloc = BlocProvider.of<UpcomingBloc>(context);
    if (_upcomingBloc.state is UpcomingInitial ||
        _upcomingBloc.state is UpcomingFetchError) {
      _upcomingBloc.add(FetchUpcomingMovies());
    }
    _listenScrollActivity();
  }

  /// This method adds a listener to the [_upcomingMoviesScrollController] to
  /// check if the scroll position has reached the end of the scrollable area.
  /// If it has, and the state of [_upcomingBloc] is [UpcomingFetched], then it
  /// adds a new [FetchUpcomingMovies] event to [_upcomingBloc]. This will
  /// trigger the bloc to fetch more movies.
  void _listenScrollActivity() {
    _upcomingMoviesScrollController.addListener(() {
      if (_upcomingMoviesScrollController.position.pixels ==
          _upcomingMoviesScrollController.position.maxScrollExtent) {
        if (_upcomingBloc.state is UpcomingFetched) {
          _upcomingBloc.add(FetchUpcomingMovies());
        }
      }
    });
  }

  @override
  /// This method builds the UI for the upcoming movies widget. It
  /// returns a [BlocBuilder] widget that listens to the
  /// [UpcomingBloc] and builds the UI based on the state of the
  /// bloc. If the state is [UpcomingFetchLoading], it shows a
  /// [listViewLoader] widget. If the state is [UpcomingFetchError],
  /// it shows a [ErrorHomeWidget] with the title 'Upcoming Movies',
  /// the error message, and a refresh button. If the state is
  /// [UpcomingFetched], it shows a [Column] widget with a
  /// [titleButtonRow] and a [ListViewWidget] with the list of
  /// upcoming movies. If the state is not any of these states, it
  /// returns a [SizedBox] widget with a height of 0.
  Widget build(BuildContext context) {
    String title = "Upcoming Movies";
    return BlocBuilder<UpcomingBloc, UpcomingState>(builder: (context, state) {
      if (state is UpcomingFetchLoading) {
        return SizedBox(height: 280, child: listViewLoader());
      } else if (state is UpcomingFetchError) {
        return ErrorHomeWidget(
          title,
          state.error,
          onRefresh: () => BlocProvider.of<UpcomingBloc>(context)
              .add(RefreshUpcomingMovies()),
        );
      } else if (state is UpcomingFetched) {
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
                                moviesList: state.upcomingMovies,
                                controller: _upcomingMoviesScrollController,
                                bloc: _upcomingBloc,
                              )));
                }),
            SizedBox(
                height: 280,
                child: ListViewWidget(
                  movies: getSubList(state.upcomingMovies),
                  randomId: 3,
                )),
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
