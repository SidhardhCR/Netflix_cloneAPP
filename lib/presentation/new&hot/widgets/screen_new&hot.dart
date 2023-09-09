import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/widgets/custom_App_bar.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const CustomAppBar(
            name: 'New & Hot',
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                labelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(
                    text: '     🍿 Coming Soon     ',
                  ),
                  Tab(
                    text: "    👀 Everyone's Watching    ",
                  ),
                ]),
          ),
        ),
        body: TabBarView(children: [
          _comingsoon(),
          _everyonesWatching(),
        ]),
      ),
    );
  }

  Widget _comingsoon() {
    return const Center(child: Text('Coming Soon'));
  }

  Widget _everyonesWatching() {
    return const Center(child: Text('Everyones Watching'));
  }
}
