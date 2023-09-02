import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';

const image =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg";

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final index;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width,
        height: size.height,
        color: Colors.accents[index % Colors.accents.length],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //right side
              CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off_rounded,
                        color: Colors.white,
                      ))),

              //left side
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 30,
                  ),
                  kHeight,
                  ActionsButtons(
                    icon: Icons.emoji_emotions,
                    title: 'LOL',
                  ),
                  kHeight,
                  ActionsButtons(
                    icon: Icons.add,
                    title: 'My List',
                  ),
                  kHeight,
                  ActionsButtons(
                    icon: Icons.telegram,
                    title: 'Share',
                  ),
                  kHeight,
                  ActionsButtons(
                    icon: Icons.play_arrow,
                    title: 'Play',
                  ),
                  kHeight,
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}

class ActionsButtons extends StatelessWidget {
  const ActionsButtons({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
