import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'bloc/search_movies/search_movies_bloc.dart';
import 'bloc/cast_details/cast_details_bloc.dart';
import 'bloc/movie_details/movie_details_bloc.dart';
import 'bloc/popular_movies/popular_bloc.dart';
import 'bloc/top_rated_movies/top_rated_bloc.dart';
import 'bloc/upcoming_movies/upcoming_bloc.dart';
import 'bloc/video_details/video_bloc.dart';
import 'pages/splash_screen/splash_screen.dart';
import 'utils/locators.dart';
import 'utils/theme.dart';

/// The main function initializes the Flutter app by ensuring the initialization of widgets,
/// setting up locators, loading environment variables from the .env file, and running the app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  await dotenv.load(fileName: "assets/env/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  /// The build method returns a [MaterialApp] widget as the root of the app,
  /// with a [MultiBlocProvider] as its child. The [MultiBlocProvider]
  /// provides the BLoC instances for the app, which are:
  ///
  /// 1. [PopularBloc] to handle popular movies.
  /// 2. [TopRatedBloc] to handle top rated movies.
  /// 3. [UpcomingBloc] to handle upcoming movies.
  /// 4. [MovieDetailsBloc] to handle movie details.
  /// 5. [CastDetailsBloc] to handle cast details.
  /// 6. [SearchMoviesBloc] to handle search movies.
  /// 7. [VideoBloc] to handle video details.
  ///
  /// The [MaterialApp] is configured with the title of the app, theme, dark
  /// theme, and theme mode. The theme mode is set to [ThemeMode.dark] to
  /// apply the dark theme by default. The home of the app is a [SplashScreen]
  /// widget, which is the first screen that the user sees when the app is
  /// launched.
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<PopularBloc>()),
        BlocProvider(create: (context) => locator<TopRatedBloc>()),
        BlocProvider(create: (context) => locator<UpcomingBloc>()),
        BlocProvider(create: (context) => locator<MovieDetailsBloc>()),
        BlocProvider(create: (context) => locator<CastDetailsBloc>()),
        BlocProvider(create: (context) => locator<SearchMoviesBloc>()),
        BlocProvider(create: (context) => locator<VideoBloc>()),
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
