import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';

class Gallery extends StatefulWidget {
  final List<String> exerciseList;
  final List<String> descriptionList;
  final List<String> tagList;
  final bool playlistGallery;

  const Gallery(
      {Key? key,
      required this.exerciseList,
      required this.playlistGallery,
      required this.descriptionList,
      required this.tagList})
      : super(key: key);

  @override
  GalleryState createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  List<String> exercisesToDisplay = [
    'Pushup',
    'Crunch',
    'Neck Circles',
    'Hamstring Stretch',
    'Plank',
    'Hip Flexor Stretch',
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

  Widget buildGrid(BuildContext context, exerciseList, descriptionList, tagList,
      playlistGallery) {
    //TOO: figure out userEffect but in flutter to get rid of duplicate list
    // exercisesToDisplay = exerciseList;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 8 / 7,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: exercisesToDisplay.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (_) => ExerciseDialog(
                        exerciseList[index], descriptionList[index]));
              },
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ListTile(
                      title: Text(exercisesToDisplay[index]),
                      tileColor: Theme.of(context).primaryColor,
                    ),
                    Stack(alignment: Alignment.bottomLeft, children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.9,
                        child: Image.asset(
                          'images/pushup.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Padding(
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
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 3.0),
                                    child: const Text('ADD',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000))),
                                  ),
                                ),
                              ))),
                      Positioned(
                          top: 25,
                          right: 0,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  addToLibrary();
                                },
                                icon: const Icon(Icons.favorite),
                              )))
                    ]),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '#' + tagList[index],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ))),
                  ],
                ),
              ));
        });
  }

  // from https://stackoverflow.com/questions/60813379/how-to-put-searchbar-into-appbar-flutter
  Widget buildSearchBar(BuildContext context, exerciseList) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(hintText: 'Search Exercise'),
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
          child: buildGrid(context, widget.exerciseList, widget.descriptionList,
              widget.tagList, widget.playlistGallery))
    ]);
  }
}

class ExerciseDialog extends StatelessWidget {
  ExerciseDialog(this.exercise, this.description);
  final String exercise;
  final String description;

  void addToWorkouts(value) {
    print("this is value " + value);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          height: 700,
          width: 800,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  title: Text(exercise, style: modalTitle),
                  trailing: PopupMenuButton(
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
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 3.0),
                        child: const Text('ADD',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000))),
                      ),
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset(
                    'images/pushup.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Description',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)))),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(description,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15)))),
              ],
            ),
          )),
    );
  }
}
