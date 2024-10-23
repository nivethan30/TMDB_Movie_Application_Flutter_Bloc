import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/popular_movies/popular_bloc.dart';
import '../../bloc/top_rated_movies/top_rated_bloc.dart';
import '../../bloc/upcoming_movies/upcoming_bloc.dart';
import '../../models/movie_list_model/movie_list_model.dart';
import 'widgets/grid_view_widget.dart';

class MoviesListView extends StatelessWidget {
  final List<MovieListModel> moviesList;
  final ScrollController controller;
  final Bloc bloc;
  final String title;
  const MoviesListView(
      {super.key,
      required this.moviesList,
      required this.title,
      required this.controller,
      required this.bloc});

  @override

/// This method builds the UI for the MoviesListView.
/// It returns a Scaffold widget with a transparent AppBar and a body that
/// displays different UI components based on the bloc type.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: bloc is TopRatedBloc
          ? BlocBuilder<TopRatedBloc, TopRatedState>(builder: (context, state) {
              bool isLoading = false;
              if (state is TopRatedFetchLoading) {
                isLoading = true;
                return _buildUI(isLoading: isLoading);
              }
              return _buildUI(isLoading: isLoading);
            })
          : bloc is UpcomingBloc
              ? BlocBuilder<UpcomingBloc, UpcomingState>(
                  builder: (context, state) {
                  bool isLoading = false;
                  if (state is UpcomingFetchLoading) {
                    isLoading = true;
                    return _buildUI(isLoading: isLoading);
                  }
                  return _buildUI(isLoading: isLoading);
                })
              : bloc is PopularBloc
                  ? BlocBuilder<PopularBloc, PopularState>(
                      builder: (context, state) {
                      bool isLoading = false;
                      if (state is PopularFetchLoading) {
                        isLoading = true;
                        return _buildUI(isLoading: isLoading);
                      }
                      return _buildUI(isLoading: isLoading);
                    })
                  : Container(),
    );
  }

  /// Returns a Container widget with a color of Colors.black12 and a padding of
  /// const EdgeInsets.all(10), and it contains a moviesGridView with the moviesList
  /// and a randomId of 4. The isLoading parameter determines whether the
  /// moviesGridView shows a loading indicator or not.
  Widget _buildUI({required bool isLoading}) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(10),
      child: moviesGridView(
          moviesList: moviesList,
          isLoading: isLoading,
          randomId: 4,
          scrollController: controller),
    );
  }
}
