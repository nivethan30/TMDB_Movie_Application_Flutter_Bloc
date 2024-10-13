import 'package:flutter/material.dart';

/// A row widget that displays a title and a button on the right side of the row
/// for viewing all items.
///
/// The [title] parameter is used to specify the title of the row, and the
/// [onTap] parameter is a callback that is invoked when the button is tapped.
///
/// The button is centered horizontally and vertically, and has a background
/// color of white with a circular border of 5 radius. The text inside the button
/// is black with a font size of 16, and the text is "View All".
Widget titleButtonRow({required String title, required VoidCallback onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: const Center(
              child: Text('View All',
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            )),
      )
    ],
  );
}
