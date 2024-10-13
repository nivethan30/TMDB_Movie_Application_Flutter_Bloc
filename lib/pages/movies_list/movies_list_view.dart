import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  /// Returns a Scaffold widget with a transparent AppBar and a BlocBuilder that builds
  /// the UI based on the state of the bloc. The UI is a Container with a color of
  /// Colors.black12 and a padding of const EdgeInsets.all(10), and it contains a
  /// GridViewWidget with the moviesList and a randomId of 4.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder(bloc: bloc, builder: (context, state) => _buildUI()),
    );
  }

  /// Returns a Container widget with a color of Colors.black12 and a padding of const
  /// EdgeInsets.all(10), and it contains a GridViewWidget with the moviesList and a
  /// randomId of 4.
  Widget _buildUI() {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(10),
      child: moviesGridView(
          moviesList: moviesList, randomId: 4, scrollController: controller),
    );
  }
}
