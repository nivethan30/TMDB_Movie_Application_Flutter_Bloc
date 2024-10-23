import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/cast_details/cast_details_bloc.dart';
import '../../../models/cast_model/cast_model.dart';
import '../../../utils/locators.dart';
import '../../image_viewer/image_viewer.dart';

class CastDetails extends StatelessWidget {
  final int movieId;
  const CastDetails({super.key, required this.movieId});

  @override
  ///
  /// This method builds the UI for the cast details page. It returns a
  /// [SizedBox] widget with the height of 200 and width of double.infinity.
  ///
  /// Inside the [SizedBox], it uses a [BlocBuilder] widget to listen to the
  /// state of the [CastDetailsBloc]. If the state is [CastDetailsLoading],
  /// it shows a [CircularProgressIndicator]. If the state is
  /// [CastDetailsError], it shows a [SizedBox] with the error message and a
  /// [TextButton] to retry. If the state is [CastDetailsLoaded], it shows a
  /// [ListView] of the cast members where each item is a [GestureDetector]
  /// widget with a [CircleAvatar] and a [Text] widget. The [CircleAvatar]
  /// displays the profile picture of the cast member and the [Text] widget
  /// displays the name of the cast member. If the cast member has a profile
  /// picture, it can be tapped to view the picture in the [ImageViewerWidget].
  ///
  /// Otherwise, it returns a [SizedBox] with height and width of 0.
  ///
  Widget build(BuildContext context) {
    return BlocBuilder<CastDetailsBloc, CastDetailsState>(
        builder: (context, state) {
      if (state is CastDetailsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CastDetailsError) {
        return SizedBox(
          height: 150,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(state.error),
              TextButton(
                child: const Text('Retry'),
                onPressed: () {
                  locator<CastDetailsBloc>()
                      .add(GetCastDetailsEvent(movieId: movieId));
                },
              ),
            ],
          ),
        );
      } else if (state is CastDetailsLoaded) {
        return SizedBox(
          width: double.infinity,
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.cast.length,
              itemBuilder: (context, index) {
                CastModel cast = state.cast[index];
                return GestureDetector(
                  onTap: () {
                    if (cast.profilePath != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageViewerWidget(
                                name:cast.name,
                                  imageUrl: cast.profilePath)));
                    }
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          minRadius: 50,
                          maxRadius: 50,
                          child: ClipOval(
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/original/${cast.profilePath}",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          cast.name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
