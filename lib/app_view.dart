import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/models/content_view.dart';
import 'package:workoutpersonalizer_frontend/ui/explore_page.dart';
import 'package:workoutpersonalizer_frontend/ui/my_workouts_page.dart';
import 'package:workoutpersonalizer_frontend/ui/workoutPlayer/workout_player.dart';
import 'package:workoutpersonalizer_frontend/ui/workout_creator_page.dart';
import 'package:workoutpersonalizer_frontend/widgets/navigation_bar/custom_tab.dart';
import 'package:workoutpersonalizer_frontend/widgets/navigation_bar/custom_tab_bar.dart';
class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);
  @override
  _AppViewState createState() => _AppViewState();
}
class _AppViewState extends State<AppView> with SingleTickerProviderStateMixin {
  late double screenHeight;
  late TabController tabController;
  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'My Workouts'),
      content: MyWorkoutsPage(),
    ),
    ContentView(
      tab: CustomTab(title: 'Explore'),
      content: ExplorePage(),
    ),
    ContentView(
      tab: CustomTab(title: "Workout Creator"),
      content: WorkoutCreatorPage(),
    ),
    ContentView(
      tab: CustomTab(title: "Workout Player"),
      content: WorkoutPlayer(),
    ),
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return desktopView();
        }
      ),
    );
  }
  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTabBar(
          controller: tabController,
          tabs: contentViews.map((e) => e.tab).toList(),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: contentViews.map((e) => e.content).toList(),
          ),
        ),
      ],
    );
  }
}