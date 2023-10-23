import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/application/search/search_bloc.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';
import 'package:netflix_clone_app/core/strings.dart';
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
          const title(
            title1: 'Top Searches',
          ),
          kHeight,
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(child: Text('Error'));
              } else if (state.idleList.isEmpty) {
                return const Center(child: Text('List is empty'));
              }

              return Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) => SearchTile(
                        title1: '${state.idleList[index].movieName}',
                        imageUrl:
                            '$kImageUrl${state.idleList[index].posterPath}'),
                    separatorBuilder: (ctx, index) => kHeight,
                    itemCount: state.idleList.length),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  const SearchTile({super.key, required this.title1, required this.imageUrl});

  final String title1;
  final String imageUrl;

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
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        kWidth,
        Expanded(
          child: Text(
            title1,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
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
