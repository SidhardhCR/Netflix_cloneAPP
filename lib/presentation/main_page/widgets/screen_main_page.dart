import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone_app/presentation/fast_laugh/widgets/screen_fast_laugh.dart';
import 'package:netflix_clone_app/presentation/home/widgets/screen_home.dart';

import 'package:netflix_clone_app/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone_app/presentation/new&hot/widgets/screen_new&hot.dart';
import 'package:netflix_clone_app/presentation/search/widgets/screen_search.dart';

const page = [
  ScreenHome(),
  ScreenNewAndHot(),
  ScreenFastLaugh(),
  ScreenSearch(),
  ScreenDownloads(),
];

class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, index, _) {
            return page[index];
          },
        ),
        bottomNavigationBar: BottomNav());
  }
}
