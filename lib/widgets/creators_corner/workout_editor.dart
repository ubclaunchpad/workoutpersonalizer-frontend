import 'package:flutter/material.dart';

class WorkoutEditor extends StatefulWidget {
  const WorkoutEditor({Key? key}) : super(key: key);

  @override
  WorkoutEditorState createState() => WorkoutEditorState();
}

class WorkoutEditorState extends State<WorkoutEditor> {
  List<String> chosenExercises = [];

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {
        return GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
              ),
          itemCount: chosenExercises.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(chosenExercises[index]),
                    subtitle: Text('muscle group',
                        style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  ),
                  Text(
                    'description',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            );
          }
        );
      },
      onAccept: (String data) {
        setState(() {
          //print(data);
          chosenExercises.add(data);
        });
      },
    );  
  }
}