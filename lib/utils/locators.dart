import 'package:get_it/get_it.dart';
import '../bloc/cast_details/cast_details_bloc.dart';
import '../bloc/movie_details/movie_details_bloc.dart';
import '../bloc/popular_movies/popular_bloc.dart';
import '../bloc/search_movies/search_movies_bloc.dart';
import '../bloc/top_rated_movies/top_rated_bloc.dart';
import '../bloc/upcoming_movies/upcoming_bloc.dart';
import '../bloc/video_details/video_bloc.dart';
import '../repository/cast_api.dart';
import '../repository/movie_api.dart';
import '../repository/movie_list_api.dart';
import '../repository/search_api.dart';
import '../repository/video_api.dart';

final locator = GetIt.instance;

/// Registers all singletons with [GetIt].
///
/// This should be called once, at the beginning of the app, to setup all the
/// dependencies for the app.
void setupLocators() {
  locator.registerSingleton<MovieApi>(MovieApi());
  locator.registerSingleton<MovieListApi>(MovieListApi());
  locator.registerSingleton<CastApi>(CastApi());
  locator.registerSingleton<SearchApi>(SearchApi());
  locator.registerSingleton<VideoApi>(VideoApi());
  locator.registerSingleton<TopRatedBloc>(TopRatedBloc(locator<MovieListApi>()));
  locator.registerSingleton<PopularBloc>(PopularBloc(locator<MovieListApi>()));
  locator.registerSingleton<UpcomingBloc>(UpcomingBloc(locator<MovieListApi>()));
  locator.registerSingleton<MovieDetailsBloc>(MovieDetailsBloc(locator<MovieApi>()));
  locator.registerSingleton<CastDetailsBloc>(CastDetailsBloc(locator<CastApi>()));
  locator.registerSingleton<SearchMoviesBloc>(SearchMoviesBloc(locator<SearchApi>()));
  locator.registerSingleton<VideoBloc>(VideoBloc(locator<VideoApi>()));
}