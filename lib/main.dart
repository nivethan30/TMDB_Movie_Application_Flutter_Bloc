import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'bloc/search_movies/search_movies_bloc.dart';
import 'bloc/cast_details/cast_details_bloc.dart';
import 'bloc/movie_details/movie_details_bloc.dart';
import 'bloc/popular_movies/popular_bloc.dart';
import 'bloc/top_rated_movies/top_rated_bloc.dart';
import 'bloc/upcoming_movies/upcoming_bloc.dart';
import 'pages/splash_screen/splash_screen.dart';
import 'repository/cast_api.dart';
import 'repository/movie_api.dart';
import 'repository/movie_list_api.dart';
import 'repository/search_api.dart';
import 'utils/theme.dart';

/// The main entry point for the application.
///
/// This function does the following:
///
/// 1. Ensures that the widgets binding is initialized.
/// 2. Loads the environment variables from the file at
///    `assets/env/.env`.
/// 3. Runs the application with the root widget as a [MyApp].
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/env/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  /// This is the root widget of the application. It sets up the blocs of the
  /// application and sets up the theme. The theme is set to dark mode, and the
  /// home widget is set to [SplashScreen].
  ///
  /// It also sets up the providers of the blocs of the application. The
  /// providers are as follows:
  ///
  /// - [PopularBloc] is a bloc that fetches the popular movies from the
  ///   server.
  /// - [TopRatedBloc] is a bloc that fetches the top rated movies from the
  ///   server.
  /// - [UpcomingBloc] is a bloc that fetches the upcoming movies from the
  ///   server.
  /// - [MovieDetailsBloc] is a bloc that fetches the movie details from the
  ///   server.
  /// - [CastDetailsBloc] is a bloc that fetches the movie cast from the
  ///   server.
  /// - [SearchMoviesBloc] is a bloc that fetches the search results from the
  ///   server.
  Widget build(BuildContext context) {
    final MovieListApi movieListApi = MovieListApi();
    final MovieApi movieApi = MovieApi();
    final CastApi castApi = CastApi();
    final SearchApi searchApi = SearchApi();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PopularBloc(movieListApi)),
        BlocProvider(create: (context) => TopRatedBloc(movieListApi)),
        BlocProvider(create: (context) => UpcomingBloc(movieListApi)),
        BlocProvider(create: (context) => MovieDetailsBloc(movieApi)),
        BlocProvider(create: (context) => CastDetailsBloc(castApi)),
        BlocProvider(create: (context) => SearchMoviesBloc(searchApi)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TMDB Movie App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home: const SplashScreen(),
      ),
    );
  }
}
