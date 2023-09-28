import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';
import 'package:netflix_clone_app/core/strings.dart';
import 'package:netflix_clone_app/presentation/widgets/custom_App_bar.dart';

const imageList = [
  "https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
  "https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
];

const widgetsList = [_SmartDownloads(), Section2(), Section3()];

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const CustomAppBar(
            name: 'Downloads',
          ),
        ),
        body: SafeArea(
          child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, index) => widgetsList[index],
              separatorBuilder: (ctx, index) => const SizedBox(
                    height: 12,
                  ),
              itemCount: widgetsList.length),
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(DownloadsEvent.getDownloadsImage());
    });
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Center(
            child: Text(
          "Introducing Download For You",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        )),
        const Center(
          child: Text(
            textAlign: TextAlign.center,
            "We'll download a personalised  selsection of \n movies and shows for you, so there's\n always somthing to watch on your\n device.",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        SizedBox(
          width: size.width,
          height: 300,
          child: BlocBuilder<DownloadsBloc, DownloadsState>(
            builder: (context, state) {
              return state.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: size.width,
                      height: 300,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              radius: size.width * 0.31,
                            ),
                          ),
                          DownloadImageWidget(
                            imageList:
                                '$kImageUrl${state.downloads?[5].posterPath}',
                            angles: 20,
                            margins:
                                const EdgeInsets.only(left: 138, bottom: 35),
                            size: Size(size.width * 0.28, size.height * 0.28),
                          ),
                          DownloadImageWidget(
                              imageList:
                                  '$kImageUrl${state.downloads?[1].posterPath}',
                              angles: -20,
                              margins:
                                  const EdgeInsets.only(right: 138, bottom: 35),
                              size:
                                  Size(size.width * 0.28, size.height * 0.28)),
                          DownloadImageWidget(
                            imageList:
                                '$kImageUrl${state.downloads?[2].posterPath}',
                            angles: 0,
                            margins: const EdgeInsets.only(left: 0),
                            size: Size(size.width * 0.35, size.height * 0.3),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            height: 45,
            onPressed: () {},
            color: Colors.blue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          height: 45,
          onPressed: () {},
          color: Colors.white,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        kWidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      required this.imageList,
      this.angles = 0,
      required this.margins,
      required this.size});
  final String imageList;
  final double angles;
  final EdgeInsets margins;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angles * pi / 180,
      child: Container(
        margin: margins,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList),
            )),
      ),
    );
  }
}
