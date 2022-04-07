import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/widgets/explore/sidelayout.dart';
import '../widgets/explore/gallery_view.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Future<List<Exercise>> allExercises;

  @override
  void initState() {
    super.initState();
    allExercises = fetchAllExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      SideLayout(),
      //TODO: fix overflowing issues with small window size (https://ubclaunchpad.atlassian.net/browse/WP-74)
      const VerticalDivider(
        color: Color(0xFFDADADA),
        thickness: 2,
      ),
      Expanded(
          flex: 6,
          child: Container(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder<List<Exercise>>(
                  future: allExercises,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Gallery(
                          exerciseList: snapshot.data ?? [],
                          playlistGallery: true);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })))
    ]);
  }
}
