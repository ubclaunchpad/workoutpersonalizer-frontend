import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';

class SideLayout extends StatefulWidget {
  @override
  SideLayoutState createState() => new SideLayoutState();
}

class SideLayoutState extends State<SideLayout> {
  Map<String, bool> muscleGroupValues = {
    'Chest': false,
    'Back': false,
    'Arms': false,
    'Shoulders': false,
    'Legs': false,
    'Calves': false,
    'Abs': false,
    'Neck': false,
  };

  Map<String, bool> exerciseTypeValues = {
    'Cardio': false,
    'Endurance': false,
    'HIIT': false,
    'Pilates': false,
    'Weight training': false,
    'Yoga': false,
  };

  Map<String, bool> difficultyLevelValues = {
    'Easy': false,
    'Intermediate': false,
    'Advanced': false,
  };

  Map<String, bool> equiptmentValues = {
    'Weight': false,
    'Resistance bands': false,
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          color: Color(0x00000000),
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFFCD78),
                    child: Icon(Icons.airline_seat_legroom_extra,
                        size: 30, color: Colors.black),
                  ),
                  Text(
                    " Muscle Groups",
                    style: filterHeaderStyle,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  controller: ScrollController(),
                  children: muscleGroupValues.keys.map((String key) {
                    return CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(key, style: filterItemStyle),
                      value: muscleGroupValues[key],
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            muscleGroupValues[key] = value;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFFCD78),
                    child: Icon(Icons.self_improvement,
                        size: 30, color: Colors.black),
                  ),
                  Text(
                    " Exercise Types",
                    style: filterHeaderStyle,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  controller: ScrollController(),
                  children: exerciseTypeValues.keys.map((String key) {
                    return CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(key, style: filterItemStyle),
                      value: exerciseTypeValues[key],
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            exerciseTypeValues[key] = value;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFFCD78),
                    child: Icon(Icons.trending_up_sharp,
                        size: 30, color: Colors.black),
                  ),
                  Text(
                    " Difficulty Level",
                    style: filterHeaderStyle,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  controller: ScrollController(),
                  children: difficultyLevelValues.keys.map((String key) {
                    return CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(key, style: filterItemStyle),
                      value: difficultyLevelValues[key],
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            difficultyLevelValues[key] = value;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFFCD78),
                    child: Icon(Icons.fitness_center,
                        size: 30, color: Colors.black),
                  ),
                  Text(
                    " Equiptment",
                    style: filterHeaderStyle,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  controller: ScrollController(),
                  children: equiptmentValues.keys.map((String key) {
                    return CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(key, style: filterItemStyle),
                      value: equiptmentValues[key],
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            equiptmentValues[key] = value;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          )),
    );
  }
}
