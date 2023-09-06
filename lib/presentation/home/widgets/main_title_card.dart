import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';
import 'package:netflix_clone_app/presentation/home/widgets/main_card.dart';
import 'package:netflix_clone_app/presentation/search/widgets/title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.size, required this.title2});

  final Size size;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(title1: title2),
        kHeight,
        LimitedBox(
            maxHeight: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => MainCard(size: size)),
                separatorBuilder: ((context, index) => const SizedBox(
                      width: 10,
                    )),
                itemCount: 10))
      ],
    );
  }
}
