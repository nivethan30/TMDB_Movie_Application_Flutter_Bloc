import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A CarouselSlider widget that displays a series of skeletonized landscape
/// images. Intended for use as a placeholder while the actual data is being
/// loaded.
Widget carouselSliderLoader() {
  return Skeletonizer(
      enabled: true,
      child: CarouselSlider.builder(
        itemCount: 8,
        itemBuilder: (context, index, _) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://blocks.astratic.com/img/general-img-landscape.png',
                  fit: BoxFit.cover,
                )),
          );
        },
        options: CarouselOptions(
            autoPlay: true, aspectRatio: 16 / 9, enlargeCenterPage: true),
      ));
}
