import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/new&hot/widgets/Coming_Soon_widget.dart';
import 'package:netflix_clone_app/presentation/new&hot/widgets/Everyones_watching_widget.dart';
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
          _comingsoon(context),
          _everyonesWatching(),
        ]),
      ),
    );
  }

  Widget _comingsoon(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => const ComingSoonWidget(),
      itemCount: 10,
    );
  }

  Widget _everyonesWatching() {
    return ListView.builder(
      itemBuilder: ((context, index) => const EveryoneWatchingWidget()),
      itemCount: 10,
    );
  }
}
