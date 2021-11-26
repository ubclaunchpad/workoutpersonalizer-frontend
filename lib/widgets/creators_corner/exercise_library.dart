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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
        itemCount: _exerciseList.length,
        itemBuilder: (BuildContext context, int index) {
          return Draggable(
            hitTestBehavior: HitTestBehavior.translucent,
            feedback: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.1, 1.1),
                    blurRadius: 10.0,
                  ),
                ],
                color: Colors.white,
                border: Border.all(width: 5),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(15)),
                  Text(_exerciseList[index]),
                  const Padding(padding: EdgeInsets.all(5)),
                  const Text('muscle group'),
                  const Padding(padding: EdgeInsets.all(15)),
                ],
              ),
            ),
            data: index,
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(_exerciseList[index]),
                    subtitle: Text('muscle group',
                        style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  ),
                  Text(
                    'description',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(50.0, 30.0, 5.0, 30.0)),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                // TODO: Turn into a button
                child: Text('All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                child: Text('|',
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                // TODO: Turn into a button
                child: Text('Saved',
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ),
            ),
            // TODO: Fix alignment of button
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                //TODO: implement adding break feature (WP-37)
                print('Received Click');
              },
              child: const Text('Add Break'),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(50.0, 30.0, 5.0, 30.0)),
          ],
        ),
        Expanded(
          child: Scaffold(body: buildGrid(context)),
        ),
      ],
    );
  }
}
