import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/widgets/creators_corner/labeled_check_box.dart';

class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  FilterListState createState() => FilterListState();
}

class FilterListState extends State<FilterList> {
  

  @override
  void initState() {
    super.initState();
  }

  Widget buildHeader(String headerName) {
    return Row(
      children: <Widget>[
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Color(0xFFC4C4C4),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8, top: 2.5),
          child: Text(
            headerName,
            style: filterHeaderStyle,
          ),
        ),
      ],
    );
  }

  Widget buildItems(BuildContext context, List<String> items, List<bool> selected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return LabeledCheckbox(
            label: items[index],
            padding: const EdgeInsets.all(0),
            value: selected[index],
            onChanged: (bool newValue) {
              setState(() {
                selected[index] = newValue;
              });
            }
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> muscleGroups = ["Chest", "Back", "Arms", "Shoulders", "Legs", "Calves", "Abs", "Neck"];
    List<bool> muscleGroupsSelected = [false, false, false, false, false, false, false, false];
    List<String> exerciseTypes = ["Cardio", "Yoga", "HIIT", "Pilates", "Endurance", "Weight Training"];
    List<bool> exerciseTypesSelected = [false, false, false, false, false, false];

    return Expanded(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        children: <Widget>[
          buildHeader("Muscle Group"),
          buildItems(context, muscleGroups, muscleGroupsSelected),
          buildHeader("Exercise Types"),
          buildItems(context, exerciseTypes, exerciseTypesSelected),
        ],
      ),
    );
  }
}
