
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';
import 'package:netflix_clone_app/presentation/home/widgets/button_text_icon.dart';
import 'package:netflix_clone_app/presentation/home/widgets/main_title_card.dart';
import 'package:netflix_clone_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone_app/presentation/search/widgets/title.dart';

const image1 =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/ihBi24EIr5kwAeY2PqmsgAcCj4n.jpg';
const image2 =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/nrtbv6Cew7qC7k9GsYSf5uSmuKh.jpg';
const netflixLogo =
    'https://preview.redd.it/gj1t3nckxyx61.png?auto=webp&s=a0925041ccf11f7453ba4b27cfec24afa0f34594';

ValueNotifier scrolldirection = ValueNotifier(true);
ScrollDirection sDirection = ScrollDirection.idle;

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: scrolldirection,
              builder: ((context, value, child) =>
                  NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      final ScrollDirection direction = notification.direction;

                      sDirection = direction;
                      print(sDirection);
                      if (direction == ScrollDirection.reverse) {
                        scrolldirection.value = false;
                      } else if (direction == ScrollDirection.forward) {
                        scrolldirection.value = true;
                      }
                      return true;
                    },
                    child: Stack(
                      children: [
                        ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 500,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(image2))),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: -5,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const ButtonTextIcon(
                                          title: 'My List',
                                          icon: Icons.add,
                                        ),
                                        TextButton.icon(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white)),
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.play_arrow,
                                              color: Colors.black,
                                            ),
                                            label: const Text(
                                              'Play',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            )),
                                        const ButtonTextIcon(
                                            icon: Icons.info_outlined,
                                            title: 'info')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MainTitleCard(
                              size: size,
                              title2: 'Released in the past year',
                            ),
                            MainTitleCard(
                              size: size,
                              title2: 'Trending Now',
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const title(title1: "Top 10"),
                                kHeight,
                                LimitedBox(
                                    maxHeight: 200,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: ((context, index) =>
                                            NumberCard(
                                              index: index,
                                            )),
                                        separatorBuilder: ((context, index) =>
                                            const SizedBox(
                                              width: 10,
                                            )),
                                        itemCount: 10))
                              ],
                            ),
                            MainTitleCard(
                              size: size,
                              title2: 'Tense Drama',
                            ),
                            MainTitleCard(
                              size: size,
                              title2: 'South Indian Cinema',
                            ),
                          ],
                        ),
                        scrolldirection.value == true
                            ? AnimatedContainer(
                                duration: const Duration(milliseconds: 1000),
                                width: double.infinity,
                                height: 100,
                                color: Colors.black.withOpacity(0.3),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Image(
                                          image: NetworkImage(netflixLogo),
                                          width: 70,
                                          height: 70,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.cast,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        kWidth,
                                        Container(
                                          width: 30,
                                          height: 30,
                                          color: Colors.blue,
                                        ),
                                        kWidth,
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'TV Shows',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          'Movies',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          'Categories',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : kHeight
                      ],
                    ),
                  )))),
    );
  }
}
