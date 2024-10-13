import 'package:flutter/material.dart';

class ErrorHomeWidget extends StatelessWidget {
  final String title;
  final String error;
  final VoidCallback onRefresh;
  const ErrorHomeWidget(this.title, this.error,
      {super.key, required this.onRefresh});

  @override
  /// Returns a [SizedBox] with a [Center] widget containing a [Column] with
  /// a [Text] widget displaying the error message and an [ElevatedButton]
  /// with a refresh button. The [ElevatedButton] is used to retry fetching
  /// the data when pressed.
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Text(
              "Error in Fetching $title \n $error",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: onRefresh, child: const Text('Refresh Data'))
          ],
        ),
      ),
    );
  }
}
