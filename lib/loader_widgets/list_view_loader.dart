import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A ListView widget that displays a series of skeletonized landscape
/// images. Intended for use as a placeholder while the actual data is being
/// loaded.
Widget listViewLoader() {
  return Skeletonizer(
      enabled: true,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://blocks.astratic.com/img/general-img-landscape.png',
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  width: 120,
                  child: Text(
                    'Movie',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            );
          }));
}
