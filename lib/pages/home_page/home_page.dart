import 'package:flutter/material.dart';
import '../search_page/search_page.dart';
import 'popular_movies.dart';
import 'top_rated_movies.dart';
import 'upcoming_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  /// Returns a Scaffold widget with a transparent AppBar and a HomeBody widget.
  ///
  /// The Scaffold has its backgroundColor set to Colors.black12, and the
  /// AppBar has its foregroundColor set to white, backgroundColor set to
  /// Colors.transparent, elevation set to 0, and title set to 'TMDB Movies'.
  ///
  /// The AppBar has a single action which is an IconButton with an icon of
  /// Icons.search, which navigates to the SearchPage when pressed.
  ///
  /// The body of the Scaffold is a HomeBody widget.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('TMDB Movies'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage()));
                  },
                  icon: const Icon(Icons.search)))
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(10),
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PopularMovies(),
            TopRatedMovies(),
            UpcomingMovies(),
          ],
        ),
      ),
    );
  }
}
