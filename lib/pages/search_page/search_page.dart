import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/search_movies/search_movies_bloc.dart';
import '../../loader_widgets/grid_view_loader.dart';
import '../movies_list/widgets/grid_view_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchMoviesBloc _searchMoviesBloc;
  final ScrollController _searchScrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();

  @override
  /// This method is called when the widget is inserted into the tree. It
  /// initializes the [_searchMoviesBloc] field with the bloc provided by
  /// the parent widget, and it also sets up the [_listenScrollActivity] method
  /// as a listener for the [_searchScrollController].
  /// 
  /// This is a mandatory method for the [StatefulWidget] class.
  void initState() {
    super.initState();
    _searchMoviesBloc = BlocProvider.of<SearchMoviesBloc>(context);
    _listenScrollActivity();
  }

  @override
  /// This method is called when the widget is removed from the tree. It
  /// disposes the [_textFieldFocus] and [_controller] fields to free up
  /// memory.
  ///
  /// This is a mandatory method for the [StatefulWidget] class.
  void dispose() {
    super.dispose();
    _textFieldFocus.dispose();
    _controller.dispose();
  }

  /// This method adds a listener to the [_searchScrollController] to check if
  /// the scroll position has reached the end of the scrollable area. If it has,
  /// and the state of [_searchMoviesBloc] is [SearchMoviesFetched], then it
  /// adds a new [SearchMoviesQueryEvent] to [_searchMoviesBloc] with the
  /// current query from [_controller]. This will trigger the bloc to fetch
  /// more movies.
  void _listenScrollActivity() {
    _searchScrollController.addListener(() {
      if (_searchScrollController.position.pixels ==
          _searchScrollController.position.maxScrollExtent) {
        if (_searchMoviesBloc.state is SearchMoviesFetched) {
          _searchMoviesBloc
              .add(SearchMoviesQueryEvent(query: _controller.text));
        }
      }
    });
  }

  @override
  /// This method builds the UI for the search page. It returns a [Scaffold]
  /// widget with an [AppBar] and a [Column] containing a [TextField] and an
  /// [Expanded] widget containing a [BlocBuilder] widget. The [BlocBuilder]
  /// widget listens to the [SearchMoviesBloc] and builds the UI based on the
  /// state of the bloc. If the state is [SearchMoviesInitial], it shows a
  /// [Text] widget with the text 'Search Movies...'. If the state is
  /// [SearchMoviesLoading], it shows a [gridViewLoader] widget. If the state
  /// is [SearchMoviesError], it shows a [Text] widget with the error message.
  /// If the state is [SearchMoviesFetched], it shows a [moviesGridView] widget
  /// with the list of movies. If the list is empty, it shows a [Text] widget
  /// with the text 'No Movies Found..!'. Otherwise, it returns a [SizedBox]
  /// widget with a height of 0.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies here...'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.black12,
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: _textFieldFocus,
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _controller.clear();
                            },
                            icon: const Icon(Icons.clear)),
                        hintText: 'Search Movies...',
                        border: const OutlineInputBorder(),
                      ),
                      onTapOutside: (event) {
                        _textFieldFocus.unfocus();
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          BlocProvider.of<SearchMoviesBloc>(context).add(
                              SearchMoviesQueryEvent(query: _controller.text));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
                builder: (context, state) {
              if (state is SearchMoviesInitial) {
                return const Center(child: Text('Search Movies...'));
              } else if (state is SearchMoviesLoading) {
                return gridViewLoader();
              } else if (state is SearchMoviesError) {
                return Center(child: Text(state.error));
              } else if (state is SearchMoviesFetched) {
                if (state.movieList.isEmpty) {
                  return const Center(
                    child: Text('No Movies Found..!'),
                  );
                } else {
                  return moviesGridView(
                      moviesList: state.movieList,
                      randomId: 5,
                      scrollController: _searchScrollController);
                }
              } else {
                return const SizedBox.shrink();
              }
            }))
          ],
        ),
      ),
    );
  }
}
