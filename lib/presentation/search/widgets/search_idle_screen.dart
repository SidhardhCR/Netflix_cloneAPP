import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';
import 'package:netflix_clone_app/presentation/search/widgets/title.dart';

const posterImage =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/56v2KjBlU4XaOv9rVYEQypROD7P.jpg';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(
            title1: 'Top Searches',
          ),
          kHeight,
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) => SearchTile(),
                separatorBuilder: (ctx, index) => kHeight,
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: width * 0.38,
          height: 85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(posterImage))),
        ),
        kWidth,
        Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
