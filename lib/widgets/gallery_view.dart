import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/screens/playlist_gallery.dart';

class Gallery extends StatefulWidget {
  final List<String> exerciseList;
  final bool playlistGallery;

  const Gallery(
      {Key? key, required this.exerciseList, required this.playlistGallery})
      : super(key: key);

  @override
  GalleryState createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  List<String> exercisesToDisplay = [
    'Exercise 1',
    'Exercise 2',
    'Exercise 3',
    'Exercise 4',
    'Exercise 5',
    'Exercise 6',
    'Exercise 7'
  ];
  void addToWorkouts(value) {
    print("this is value " + value);
  }

  void addToLibrary() {
    print("add to library");
  }

  List<String> getDisplayItems(text, exerciseList) {
    List<String> ret = [];
    exerciseList.forEach((String exercise) {
      if (exercise.toLowerCase().contains(text)) {
        ret.add(exercise);
      }
    });
    return ret;
  }

  Widget buildGrid(BuildContext context, exerciseList, playlistGallery) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 13 / 16,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: exercisesToDisplay.length,
        itemBuilder: (context, index) {
          return Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  title: Text(exercisesToDisplay[index]),
                  subtitle: Text('Muscle group',
                      style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  trailing: widget.playlistGallery
                      ? IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.favorite),
                        )
                      : null,
                ),
                Stack(alignment: Alignment.bottomLeft, children: <Widget>[
                  Image.asset('images/pushup.jpg', fit: BoxFit.fitWidth),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PopupMenuButton(
                        onSelected: (value) {
                          addToWorkouts(value);
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text("First"),
                            value: "first",
                          ),
                          const PopupMenuItem(
                            child: Text("Second"),
                            value: "second",
                          )
                        ],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0), //or 15.0
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            color: Colors.black,
                            child: const Icon(Icons.add,
                                color: Colors.white, size: 25.0),
                          ),
                        ),
                      ))
                ]),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tags',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ))),
              ],
            ),
          );
        });
  }

  // from https://stackoverflow.com/questions/60813379/how-to-put-searchbar-into-appbar-flutter
  Widget buildSearchBar(BuildContext context, exerciseList) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search Exercise'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            exercisesToDisplay = getDisplayItems(text, exerciseList);
          });
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(children: [
      buildSearchBar(context, widget.exerciseList),
      Expanded(
          child:
              buildGrid(context, widget.exerciseList, widget.playlistGallery))
    ]);
  }
}
