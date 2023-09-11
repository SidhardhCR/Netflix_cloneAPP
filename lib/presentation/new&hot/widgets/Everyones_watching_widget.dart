import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';
import 'package:netflix_clone_app/presentation/widgets/button_text_icon.dart';

const image =
    "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/28er4p7B5zMSxUDQKPF1hBsgnys.jpg";

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('JAWAN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Text(
            "A man is driven by a personal vendetta to rectify the wrongs in society, while keeping a promise made years ago. He comes up against a monstrous outlaw with no fear, who's caused extreme suffering to many.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          kHeight40,
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                )),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black.withOpacity(0.7),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off_rounded,
                          color: Colors.white,
                          size: 25,
                        ))),
              ),
            ],
          ),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonTextIcon(icon: Icons.telegram, title: 'Share'),
              kWidth,
              ButtonTextIcon(icon: Icons.add, title: 'My List'),
              kWidth,
              ButtonTextIcon(icon: Icons.play_arrow, title: 'Play'),
            ],
          )
        ],
      ),
    );
  }
}
