import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';

class WorkoutEditor extends StatefulWidget {
  const WorkoutEditor({Key? key}) : super(key: key);

  @override
  WorkoutEditorState createState() => WorkoutEditorState();
}

class WorkoutEditorState extends State<WorkoutEditor> {
  List<Exercise> chosenExercises = [];

  @override
  Widget build(BuildContext context) {
    return DragTarget<Exercise>(
      builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 90, 100, 90),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
                ),
            itemCount: chosenExercises.length,
            itemBuilder: (context, index) {
              return Draggable<Exercise>(
                data: chosenExercises[index],
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
                      Text(
                        chosenExercises[index].name,
                        style: draggableBoxStyle,
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      const Text(
                        'muscle group',
                        style: draggableBoxStyle,
                      ),
                      const Padding(padding: EdgeInsets.all(15)),
                    ],
                  ),
                ),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(chosenExercises[index].name),
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
            } 
          ),
        );
      },
      onAccept: (Exercise data) {
        setState(() {
          chosenExercises.add(data);
        });
      },
    );   
  }
}