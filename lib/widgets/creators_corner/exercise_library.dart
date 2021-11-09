import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

// TODO: Displays the possible videos to add to a workout

class ExerciseLibrary extends StatefulWidget {
  @override
  ExerciseLibraryState createState() => ExerciseLibraryState();
}

class ExerciseLibraryState extends State<ExerciseLibrary> {
  final List<String> _exerciseList = [
    'exercise1',
    'exercise2',
    'exercise3',
    'exercise4',
    'exercise5',
    'exercise6',
    'exercise7'
  ];

  Widget buildGrid(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 450,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: _exerciseList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.add),
                  title: Text(_exerciseList[index]),
                  subtitle: Text(
                    'muscle group',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'description',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
            child: Text('Exercise Library',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
          child: OutlinedButton(
            onPressed: () {
              //TODO: implement adding break feature (WP-37)
              print('Received Click');
            },
            child: const Text('Add Break'),
          ),
        ),
        Expanded(
          child: Scaffold(body: buildGrid(context)),
        ),
      ],
    );
  }
}
