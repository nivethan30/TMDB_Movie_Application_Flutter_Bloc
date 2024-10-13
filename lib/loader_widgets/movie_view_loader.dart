import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';


/// Builds a [SizedBox] with a [SingleChildScrollView] as its child.
///
/// The [SingleChildScrollView] is used to display the movie details with
/// a [Stack] that contains a [SizedBox] with a [CachedNetworkImage] and
/// a [Row] with a [GestureDetector] and a [Text] as its children. The
/// [CachedNetworkImage] displays the movie backdrop image, and the
/// [Row] displays the movie title, overview, release date, genres, vote
/// average, budget, and revenue.
///
/// The [SingleChildScrollView] also contains a [Column] that displays the
/// movie cast details, production companies, and the genres as a [Text].
///
/// The [Column] is padded with a [Padding] widget to provide a margin of 10
/// pixels on both sides of the screen.
///
/// The [SizedBox] is returned as the child of a [Skeletonizer] widget in the
/// [MovieView] screen. The [Skeletonizer] is used to display a skeleton
/// loader while the movie details are being fetched from the API.
Widget movieViewLoader(double scHeight, double scWidth) {
  return Skeletonizer(
    enabled: true,
    child: Container(
      height: scHeight,
      color: Colors.black12,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: scHeight * 0.6,
              width: scWidth,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                        height: scHeight * 0.3,
                        width: scWidth,
                        child: Image.network(
                          'https://blocks.astratic.com/img/general-img-landscape.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    top: scHeight * 0.27,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: scHeight * 0.3,
                              width: scWidth * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://blocks.astratic.com/img/general-img-landscape.png',
                                    fit: BoxFit.cover,
                                  )),
                            )),
                        SizedBox(
                          height: scHeight * 0.3,
                          width: scWidth * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Movie Title',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(DateTime.now().toIso8601String()),
                              const Text(
                                "Action, Mystery, Thriller",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 18,
                                  ),
                                  Text("45"),
                                ],
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Budget: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$20000000000',
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Revenue: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\$20000000000',
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Cast Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  horizontalListView(),
                  const Text(
                    'Production Companies',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  horizontalListView()
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget horizontalListView() {
  return SizedBox(
    width: double.infinity,
    height: 200,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
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
                          child: Image.network(
                            'https://blocks.astratic.com/img/general-img-landscape.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 150,
                  child: Text(
                    'Cast Name',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }),
  );
}
