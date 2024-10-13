import 'package:flutter/material.dart';

/// A widget that displays an error message and a retry button. This widget
/// is used when an error occurs while loading a movie's details.
///
/// The [error] parameter is the error message to be displayed.
///
/// The [onRefresh] parameter is a callback that is called when the retry
/// button is pressed. This callback should attempt to re-load the movie's
/// details.
Widget movieViewError(
    {required String error, required VoidCallback onRefresh}) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(error),
      ElevatedButton(onPressed: onRefresh, child: const Text('Retry')),
    ],
  ));
}
